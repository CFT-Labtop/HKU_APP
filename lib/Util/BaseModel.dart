import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

abstract class BaseModel extends HiveObject{
  int getID();
  static DateTime fromJsonDateTime(String str) => str != null ? DateTime.parse(str) : null;
  static String toJsonDateTime(DateTime time) => DateFormat('yyyy-MM-dd hh:mm:ss').format(time);
  static List<int> fromJsonIntList(List<dynamic> data) => data != null ? (data as List<dynamic>).map((e) => int.parse(e)).toList() :[];
  static List<String> fromJsonStringList(List<dynamic> data) => data != null ? (data as List<dynamic>).map((e) => "\"" + e.toString() + "\"").toList() :[];
  static bool fromJsonBool(int data) => data == 1 ?true: false;
  static int toJsonBool(bool data) => data == true ?1: 0;
}