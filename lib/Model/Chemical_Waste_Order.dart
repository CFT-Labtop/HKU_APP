import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/LocalPhoto.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:hku_app/Util/Global.dart';

part 'Chemical_Waste_Order.g.dart';

@HiveType(typeId: 4)
class Chemical_Waste_Order extends BaseModel implements OrderInterface{
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_department;
  @HiveField(2)
  String department_code;
  @HiveField(3)
  String department_name;
  @HiveField(4)
  String ref_no;
  @HiveField(5)
  String location;
  @HiveField(6)
  DateTime po_date;
  @HiveField(7)
  String requested_by;
  @HiveField(8)
  String name_one;
  @HiveField(9)
  String name_two;
  @HiveField(10)
  String telephone_no;
  @HiveField(11)
  String remarks;
  @HiveField(12)
  int status;
  @HiveField(13)
  String dn_file;

  Chemical_Waste_Order(
      {int this.ID,
      int this.ID_department,
      String this.department_code,
      String this.department_name,
      String this.ref_no,
      String this.location,
      DateTime this.po_date,
      String this.requested_by,
      String this.name_one,
      String this.name_two,
      String this.telephone_no,
      String this.remarks,
      int this.status,
      String this.dn_file}) {}

  @override
  int getID() => this.ID;

  Chemical_Waste_Order.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.ID_department = json["ID_department"] ?? null;
    this.department_code = json["department_code"] ?? null;
    this.department_name = json["department_name"] ?? null;
    this.ref_no = json["ref_no"] ?? null;
    this.location = json["location"] ?? null;
    this.po_date = DateTime.parse(json["po_date"]) ?? null;
    this.requested_by = json["requested_by"] ?? null;
    this.name_one = json["name_one"] ?? null;
    this.name_two = json["name_two"] ?? null;
    this.telephone_no = json["telephone_no"] ?? null;
    this.remarks = json["remarks"] ?? null;
    this.status = json["status"] ?? null;
    this.dn_file = json["dn_file"] ?? null;
  }

  @override
  String getBuilding() => this.location;

  @override
  String getDepartmentName() => this.department_name;

  @override
  String getRefNo()  => this.ref_no;

  @override
  DeliveryType getType() => DeliveryType.ChemicalWaste;

  @override
  String getAccountNumber()=> "";

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
      return BaseDataBase().getAll<LocalPhoto>().firstWhere((element) => element.ref_no == this.getRefNo()).photoList;
    }catch(e){
      LocalPhoto localPhoto = new LocalPhoto(ID: LocalPhoto.getHighestID(), ref_no: this.getRefNo(), photoList:  [null, null, null], orderID: this.ID, type: DeliveryType.ChemicalWaste.value);
      await BaseDataBase().add<LocalPhoto>(localPhoto);
      return localPhoto.photoList;
    }
  }

  @override
  Future<void> updatePhotoList(List<File> fileList) async{
    try{
      LocalPhoto localPhoto = BaseDataBase().getAll<LocalPhoto>().firstWhere((element) => element.ref_no == this.ref_no);
      localPhoto.photoList = fileList;
      await localPhoto.save();
    }catch(e){
      print(e);
    }
  }
}
