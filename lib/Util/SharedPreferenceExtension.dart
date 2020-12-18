import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

extension SharedPreferenceExtension on SharedPreferences {
  Future<bool> setObject(String key,  dynamic value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value.toJson()));
  }

  Future<Map<String, dynamic>> getObject<T extends dynamic>(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key));
  }
}