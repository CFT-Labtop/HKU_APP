import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/LocalPhoto.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Dangerous_Goods_Order.g.dart';

@HiveType(typeId: 2)
class Dangerous_Goods_Order extends BaseModel with OrderInterface {
  @HiveField(0)
  int ID;
  @HiveField(1)
  String department_code;
  @HiveField(2)
  String department_name;
  @HiveField(3)
  String ac_name;
  @HiveField(4)
  int ID_department;
  @HiveField(5)
  int hospital_price;
  @HiveField(6)
  String ref_no;
  @HiveField(7)
  DateTime po_date;
  @HiveField(8)
  String requested_by;
  @HiveField(9)
  String telephone_no;
  @HiveField(10)
  int ID_account;
  @HiveField(11)
  String ac_no;
  @HiveField(12)
  String user;
  @HiveField(13)
  String building;
  @HiveField(14)
  String issued_by;
  @HiveField(15)
  int voucher;
  @HiveField(16)
  String remarks;
  @HiveField(17)
  int status;
  @HiveField(18)
  String dn_file;


  Dangerous_Goods_Order(
      {int this.ID,
      String this.department_code,
      String this.department_name,
      String this.ac_name,
      int this.ID_department,
      int this.hospital_price,
      String this.ref_no,
      DateTime this.po_date,
      String this.requested_by,
      String this.telephone_no,
      int this.ID_account,
      String this.ac_no,
      String this.user,
      String this.building,
      String this.issued_by,
      int this.voucher,
      String this.remarks,
      int this.status,
      String this.dn_file}) {}
  @override
  int getID() => this.ID;

  Dangerous_Goods_Order.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.department_code = json["department_code"] ?? null;
    this.department_name = json["department_name"] ?? null;
    this.ID_account = json["ID_account"] ?? null;
    this.ac_name = json["ac_name"] ?? null;
    this.hospital_price = json["hospital_price"] ?? null;
    this.ref_no = json["ref_no"] ?? null;
    this.po_date = DateTime.parse(json["po_date"]) ?? null;
    this.requested_by = json["requested_by"] ?? null;
    this.telephone_no = json["telephone_no"] ?? null;
    this.ac_no = json["ac_no"] ?? null;
    this.user = json["user"] ?? null;
    this.building = json["building"] ?? null;
    this.issued_by = json["issued_by"] ?? null;
    this.voucher = json["voucher"] ?? null;
    this.remarks = json["remarks"] ?? null;
    this.status = json["status"] ?? null;
    this.dn_file = json["dn_file"] ?? null;
  }

  @override
  String getBuilding() => this.building;

  @override
  String getDepartmentName() => this.department_name;

  @override
  String getRefNo() => this.ref_no;
  
  @override
  DeliveryType getType() => DeliveryType.DangerousGoods;

  @override
  String getAccountNumber() => this.ac_no;

  @override
  String getDepartmentCode() => this.department_code;

  @override
  DateTime getPODate() => this.po_date;

  @override
  String getRequestedBy() => this.requested_by;

  @override
  String getTelephone() => this.telephone_no;

  @override
  List<File> getDNLocal() {
    return BaseDataBase().getAll<LocalPhoto>().firstWhere((element) => element.type == this.getType() && element.orderID == this.ID).photoList;
  }

  @override
  List<File> updatePhotoList(List<File> fileList) {
    LocalPhoto localPhoto = BaseDataBase().getAll<LocalPhoto>().firstWhere((element) => element.type == this.getType() && element.orderID == this.ID);
    localPhoto.photoList = fileList;
    localPhoto.save();
  }
}
