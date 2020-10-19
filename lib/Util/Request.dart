import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hku_app/Util/BaseResponse.dart';

class Request {
  String baseURL;
  Dio dio;
  static final Request _request = Request._internal();
  Request._internal();
  factory Request.init(String url) {
    _request.baseURL = url;
    _request.dio = new Dio();
    (_request.dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _request.dio.options.connectTimeout = 5000;
    _request.dio.options.receiveTimeout = 3000;
    return _request;
  }
  factory Request() => _request;

  Future<BaseResponse> get({String action, Map<String, dynamic> queryParameters = const {}}) async {
    try{
      Response response = await this.dio.get(this.baseURL + action, queryParameters: queryParameters);
      return BaseResponse(response.data);
    }catch(e){
      throw e;
    }
  }
}
