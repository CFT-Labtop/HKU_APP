import 'dart:convert';

class BaseResponse {
  int code;
  String message;
  String errorMessage;
  dynamic data;

  BaseResponse(String value) {
    Map<String, dynamic> result = jsonDecode(value);
    this.code = result["code"];
    this.message = result["message"];
    if (this.code == -1)
      this.errorMessage = result["data"];
    else
      this.data = result.containsKey("data") ? result["data"] : null;
  }
}