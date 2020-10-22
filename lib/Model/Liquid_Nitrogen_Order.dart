import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/LocalPhoto.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Liquid_Nitrogen_Order.g.dart';

@HiveType(typeId: 6)
class Liquid_Nitrogen_Order extends BaseModel implements OrderInterface {
  @HiveField(0)
  int ID;
  @HiveField(1)
  String department_code;
  @HiveField(2)
  String department_name;
  @HiveField(3)
  String ac_name;
  @HiveField(4)
  int hospital_price;
  @HiveField(5)
  String ref_no;
  @HiveField(6)
  DateTime po_date;
  @HiveField(7)
  String requested_by;
  @HiveField(8)
  String telephone_no;
  @HiveField(9)
  int ID_account;
  @HiveField(10)
  String ac_no;
  @HiveField(11)
  String user;
  @HiveField(12)
  String building;
  @HiveField(13)
  String delivered_by;
  @HiveField(14)
  int voucher;
  @HiveField(15)
  String remarks;
  @HiveField(16)
  int status;
  @HiveField(17)
  String dn_file;
  @override
  int getID() => this.ID;

  Liquid_Nitrogen_Order(
      {int this.ID,
      String this.department_code,
      String this.department_name,
      String this.ac_name,
      int this.hospital_price,
      String this.ref_no,
      DateTime this.po_date,
      String this.requested_by,
      String this.telephone_no,
      int this.ID_account,
      String this.ac_no,
      String this.user,
      String this.building,
      String this.delivered_by,
      int this.voucher,
      String this.remarks,
      int this.status,
      String this.dn_file}) {}

  Liquid_Nitrogen_Order.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.department_code = json["department_code"] ?? null;
    this.department_name = json["department_name"] ?? null;
    this.ac_name = json["ac_name"] ?? null;
    this.hospital_price = json["hospital_price"] ?? null;
    this.ref_no = json["ref_no"] ?? null;
    this.po_date = DateTime.parse(json["po_date"]) ?? null;
    this.requested_by = json["requested_by"] ?? null;
    this.telephone_no = json["telephone_no"] ?? null;
    this.ac_no = json["ac_no"] ?? null;
    this.user = json["user"] ?? null;
    this.building = json["building"] ?? null;
    this.delivered_by = json["delivered_by"] ?? null;
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
  DeliveryType getType() => DeliveryType.LiquidNitrogen;

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
  Future<List<File>> getDNLocal() async {
    try{
      return BaseDataBase().getAll<LocalPhoto>().firstWhere((element) => element.ID == this.getRefNo()).photoList;
    }catch(e){
      LocalPhoto localPhoto = new LocalPhoto(ID: LocalPhoto.getHighestID(), ref_no: this.getRefNo(), photoList:  [null, null, null], orderID: this.ID, type: DeliveryType.LiquidNitrogen.value);
      await BaseDataBase().add<LocalPhoto>(localPhoto);
      return localPhoto.photoList;
    }
  }

  @override
  Future<void> updatePhotoList(List<File> fileList) {
    LocalPhoto localPhoto = BaseDataBase().getAll<LocalPhoto>().firstWhere((element) => element.type == this.getType() && element.orderID == this.ID);
    localPhoto.photoList = fileList;
    localPhoto.save();
  }
}
