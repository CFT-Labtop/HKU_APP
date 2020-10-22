import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Util/BaseResponse.dart';
import 'package:progress_dialog/progress_dialog.dart';

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

  Future<BaseResponse> run(context,{String action,
      Map<String, dynamic> queryParameters = const {},
      isDismissible = false,
      VoidCallback onDissmissPress}) async {
    ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: isDismissible);
    try {
      await pr.show();
      BaseResponse res =
          await this.get(action: action, queryParameters: queryParameters);
      await pr.hide();
      return res;
    } catch (e) {
      await pr.hide();
      Global.showAlertDialog(context, e.error);
      throw e;
    }
  }

  Future<BaseResponse> get(
      {String action, Map<String, dynamic> queryParameters = const {}}) async {
    try {
      Response response = await this
          .dio
          .get(this.baseURL + action, queryParameters: queryParameters);
      return BaseResponse(response.data);
    } on DioError catch(e) {
      throw e;
    }
  }

  Future<BaseResponse> uploadDNPhoto({String action, int ID, DeliveryType type, String ref_no, List<File> fileList}) async{
    String stringType;
    switch(type){
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
      "type": stringType,
      "ID": ID,
      "ref_no": ref_no,
//      "file": await MultipartFile.fromFile(file.path, filename:fileName)
    });
    Response response = await this
        .dio
        .post(this.baseURL + "upload_dn_file", data: {});
  }
}
