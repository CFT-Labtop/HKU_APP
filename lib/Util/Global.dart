import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hku_app/Util/BaseResponse.dart';

class Global {
  static const Color mainColor = Color.fromRGBO(0, 179, 141, 1);
  static const Color outlineColor = Colors.white;
  static const Color focusedOutlineColor = Colors.white;
  static double smallPadSize = 768;
  static double padSize = 1024;
  static double phoneRate = 1;
  static double smallPadRate = 1.2;
  static double padRate = 1.5;
  // static String baseEntry = "http://10.66.10.126:8087/hku_api/index.php";
  static String baseURL = "http://192.168.1.15/hku_api/index.php?ACTION=";
  static double responsiveSize(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= smallPadSize)
      return size * phoneRate;
    else if (screenWidth <= padRate)
      return size * smallPadRate;
    else
      return size * padRate;
  }

  static Future<BaseResponse> requestGet(
      String action, Map<String, dynamic> queryParameters) async {
    Response response =
        await Dio().get(baseURL + action, queryParameters: queryParameters);
    return BaseResponse(response.data);
  }
}
