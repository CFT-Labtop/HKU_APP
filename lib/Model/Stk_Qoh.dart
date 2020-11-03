import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:hku_app/Util/Checkable.dart';

part 'Stk_Qoh.g.dart';

@HiveType(typeId: 12)
class Stk_Qoh extends BaseModel{
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_version;
  @HiveField(2)
  DateTime AsOf_date;
  @HiveField(3)
  int ID_location;
  @HiveField(4)
  String location_code;
  @HiveField(5)
  String location_name;
  @HiveField(6)
  String store_no;
  @HiveField(7)
  String shelf;
  @HiveField(8)
  int ID_department;
  @HiveField(9)
  String department_code;
  @HiveField(10)
  String department_name;
  @HiveField(11)
  int ID_dangerous_goods;
  @HiveField(12)
  String product_name;
  @HiveField(13)
  String article_no;
  @HiveField(14)
  int qoh_total_qty;
  @HiveField(15)
  String create_user;
  @HiveField(16)
  String modify_user;

  @override
  int getID() => this.ID;

  Stk_Qoh({
    int this.ID,
    int this.ID_version,
    DateTime this.AsOf_date,
    int this.ID_location,
    String this.location_code,
    String this.location_name,
    String this.store_no,
    String this.shelf,
    int this.ID_department,
    String this.department_code,
    String this.department_name,
    int this.ID_dangerous_goods,
    String this.product_name,
    String this.article_no,
    int this.qoh_total_qty,
    String this.create_user,
    String this.modify_user,

  }) {}

  Stk_Qoh.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.ID_version = json["ID_version"] ?? null;
    this.AsOf_date = json["AsOf_date"] != null ? DateTime.parse(json["AsOf_date"]) : null;
    this.ID_location = json["ID_location"] ?? null;
    this.location_code = json["location_code"] ?? null;
    this.location_name = json["location_name"] ?? null;
    this.store_no = json["store_no"] ?? null;
    this.shelf = json["shelf"] ?? null;
    this.ID_department = json["ID_department"] ?? null;
    this.department_code = json["department_code"] ?? null;
    this.department_name = json["department_name"] ?? null;
    this.ID_dangerous_goods = json["ID_dangerous_goods"] ?? null;
    this.product_name = json["product_name"] ?? null;
    this.article_no = json["article_no"] ?? null;
    this.qoh_total_qty = json["qoh_total_qty"] ?? null;
    this.create_user = json["create_user"] ?? null;
    this.modify_user = json["modify_user"] ?? null;
  }
}