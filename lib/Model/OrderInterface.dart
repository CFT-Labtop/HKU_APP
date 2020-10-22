import 'dart:io';

import 'package:hku_app/Enums/DeliveryType.dart';

abstract class OrderInterface{
  String getRefNo();
  String getDepartmentName();
  String getDepartmentCode();
  String getRequestedBy();
  String getTelephone();
  String getAccountNumber();
  DateTime getPODate();
  String getBuilding();
  int getID();
  DeliveryType getType();
  List<File> getDNLocal();
  void updatePhotoList(List<File> fileList);
}