import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/Chemical_Waste_Order_Detail.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order_Detail.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order_Detail.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Model/Stk_Qoh.dart';
import 'package:hku_app/Model/Stk_Qoh_Detail.dart';
import 'package:hku_app/Model/Stk_Tk.dart';
import 'package:hku_app/Model/Stk_Tk_Detail.dart';
import 'package:hku_app/Model/User.dart';
import 'package:hku_app/Model/Version.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseResponse.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:hku_app/Util/SharedPreferenceExtension.dart';

import 'Global.dart';

class Request {
  String baseURL;
  Dio dio;
  static final Request _request = Request._internal();
  Request._internal();

  factory Request.init(String url) {
    _request.baseURL = url;
    _request.dio = new Dio();
    (_request.dio.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _request.dio.options.connectTimeout = 30000;
    _request.dio.options.receiveTimeout = 3000;
    return _request;
  }

  factory Request() => _request;

  Future<BaseResponse> run(context,{String action,Map<String, dynamic> data = const {},isDismissible = false,VoidCallback onDissmissPress}) async {
    ProgressDialog pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: isDismissible);
    try {
      await pr.show();
      BaseResponse res = await this.post(action: action, data: data);
      await pr.hide();
      return res;
    } 
    catch (e) {
      await pr.hide();
      Global.showAlertDialog(context, e.message);
      throw e;
    }
  }

  Future<BaseResponse> get(
      {String action, Map<String, dynamic> queryParameters = const {}}) async {
    try {
      this.dio.options.headers["token"] = Global.sharedPreferences.getString("token");
      Response response = await this
          .dio
          .get(this.baseURL + action, queryParameters: queryParameters);
      return BaseResponse(response.data);
    } on DioError catch(e) {
      if(e.error.message == "Connection failed")
        throw Exception("Coonection Failed, please ensure the hosting is active");
      else
        throw e;
    }catch (e) {
      throw e;
    }
  }

  Future<BaseResponse> post(
      {String action, Map<String, dynamic> data = const {}}) async {
    try {
      this.dio.options.headers["token"] = Global.sharedPreferences.getString("token");
      Response response =await this.dio.post(this.baseURL + action, data: data);
      BaseResponse baseResponse = BaseResponse(response.data);
      if (baseResponse.code != 200)
        throw new Exception(baseResponse.errorMessage);
      return baseResponse;
    }on DioError catch(e) {
      if(e.error.message == "Connection failed")
        throw Exception("Coonection Failed, please ensure the hosting is active");
      else
        throw e;
    }
  }

  Future<BaseResponse> uploadDNPhoto(
      {int ID, DeliveryType type, String ref_no, File file, String seq}) async {
    String stringType;
    switch (type) {
      case DeliveryType.ChemicalWaste:
        stringType = "CWF";
        break;
      case DeliveryType.DangerousGoods:
        stringType = "DGO";
        break;
      case DeliveryType.LiquidNitrogen:
        stringType = "LNO";
        break;
    }
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() +
              "_" +
              seq +
              ".jpg")
    });
    try {
      Response response = await this
          .dio
          .post(this.baseURL + "upload_dn_file", data: data, queryParameters: {
        "type": stringType,
        "ID": ID,
        "ref_no": ref_no,
      });

      BaseResponse baseResponse = BaseResponse(response.data);
      if (baseResponse.code != 200)
        throw new Exception(baseResponse.errorMessage);
      return baseResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResponse> completeDelivery({int ID, DeliveryType type}) async {
    try {
      BaseResponse response = await this.post(
          action: "mobile_complete_delivery",
          data: {"ID": ID, "status": 1, "type": type.value});
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResponse> getStockTake() async {
    try {
      BaseResponse response = await this.get(action: "mobile_get_stock_take");
      await BaseDataBase().add<Version>(Version.fromJson(response.data["Version"][0]));
      List<Location> locationList = (response.data["Location"] as List<dynamic>).map((e) => Location.fromJson(e)).toList();
      await Future.forEach(locationList, (e) async => await BaseDataBase().add<Location>(e));
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<BaseResponse> getOrder(DateTime currentSelectedDate) async {
    try {
      BaseResponse response = await Request().get(
          action: "mobile_duty_sheet",
          queryParameters: {"date": Global.dateFormat(currentSelectedDate)});
      List<Dangerous_Goods_Order> dangerous_goods_order_list =
          response.data["Dangerous_Goods_Order"].map<Dangerous_Goods_Order>((f) {return new Dangerous_Goods_Order.fromJson(f);}).where((element) => element.status == 0).toList();
      List<Dangerous_Goods_Order_Detail> dangerous_goods_order_detail_list =response.data["Dangerous_Goods_Order_Detail"].map<Dangerous_Goods_Order_Detail>((f) {return new Dangerous_Goods_Order_Detail.fromJson(f);}).toList();
      List<Liquid_Nitrogen_Order> liquid_nitrogen_order_list =
          response.data["Liquid_Nitrogen_Order"].map<Liquid_Nitrogen_Order>((f) {return new Liquid_Nitrogen_Order.fromJson(f);}).where((element) => element.status == 0).toList();
      List<Liquid_Nitrogen_Order_Detail> liquid_nitrogen_order_detail_list =
          response.data["Liquid_Nitrogen_Order_Detail"]
              .map<Liquid_Nitrogen_Order_Detail>((f) {
        return new Liquid_Nitrogen_Order_Detail.fromJson(f);
      }).toList();
      List<Chemical_Waste_Order> chemical_waste_order_list =
          response.data["Chemical_Waste_Order"]
              .map<Chemical_Waste_Order>((f) {
                return new Chemical_Waste_Order.fromJson(f);
              })
              .where((element) => element.status == 0)
              .toList();
      List<Chemical_Waste_Order_Detail> chemical_waste_order_detail_list =
          response.data["Chemical_Waste_Order_Detail"]
              .map<Chemical_Waste_Order_Detail>((f) {
        return new Chemical_Waste_Order_Detail.fromJson(f);
      }).toList();
      await Future.forEach(dangerous_goods_order_list, (element) async {
        await BaseDataBase().add<Dangerous_Goods_Order>(element);
      });
      await Future.forEach(
          liquid_nitrogen_order_list,
          (element) async =>
              await BaseDataBase().add<Liquid_Nitrogen_Order>(element));
      await Future.forEach(
          chemical_waste_order_list,
          (element) async =>
              await BaseDataBase().add<Chemical_Waste_Order>(element));
      await Future.forEach(
          dangerous_goods_order_detail_list,
          (element) async =>
              await BaseDataBase().add<Dangerous_Goods_Order_Detail>(element));
      await Future.forEach(
          liquid_nitrogen_order_detail_list,
          (element) async =>
              await BaseDataBase().add<Liquid_Nitrogen_Order_Detail>(element));
      await Future.forEach(
          chemical_waste_order_detail_list,
          (element) async =>
              await BaseDataBase().add<Chemical_Waste_Order_Detail>(element));
    } catch (e) {
      throw e;
    }
  }
  Future<BaseResponse> getQoh(BuildContext context, {int versionID, List<int> locationIDList}) async {
    try{
      BaseResponse response = await Request().run(context, action: "mobile_get_qoh", data: {"ID_version": versionID, "ID_location_list": locationIDList});
      await Future.forEach(response.data["Stk_Qoh"].map<Stk_Qoh>((f) {return new Stk_Qoh.fromJson(f);}).toList(), (element) async => await BaseDataBase().add<Stk_Qoh>(element));
      await Future.forEach(response.data["Stk_Qoh_Detail"].map<Stk_Qoh_Detail>((f) {return new Stk_Qoh_Detail.fromJson(f);}).toList(), (element) async => await BaseDataBase().add<Stk_Qoh_Detail>(element));
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<BaseResponse> uploadStockTake(BuildContext context, {List<Stk_Tk> stk_tk_list, List<Stk_Tk_Detail> detail_List}) async {
   try{
      BaseResponse response = await Request().run(context, action: "mobile_upload_stock_take", data: {"stk_tk_list": stk_tk_list.map((e) => e.toJSON()).toList(), "detail_list": detail_List.map((e) => e.toJSON()).toList()});
      List<int> id_qoh_list = stk_tk_list.map((e) => e.ID_qoh).toList();
      List<Stk_Qoh_Detail> qoh_detail_list = BaseDataBase().getAll<Stk_Qoh_Detail>();
      BaseDataBase().getAll<Stk_Qoh>().forEach((element) {
        if(id_qoh_list.contains(element.ID)){
          qoh_detail_list.where((qoh_detail) => qoh_detail.ID_stk_qoh == element.ID).forEach((qoh_detail) {
            BaseDataBase().delete<Stk_Qoh_Detail>(qoh_detail);
          });
        }
      });
      return response;
   }catch(e){
     throw e;
   }
  }

  Future<BaseResponse> login(BuildContext context, {String loginName, String password}) async {
      BaseResponse response = await Request().run(context, action: "mobile_login", data: {"loginName": loginName, "password": password});
      Global.sharedPreferences.setObject("currentUser", User.fromJson(response.data["user"]));
      Global.sharedPreferences.setString("token", response.data["token"]);
      return response;
  }

  Future<BaseResponse> logout(BuildContext context, String token) async {
    return await Request().run(context, action: "user_logout", data: {"token": token});
  }
}
