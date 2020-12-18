import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Stk_Qoh.g.dart';
@JsonSerializable()
@HiveType(typeId: 12)
class Stk_Qoh extends BaseModel{
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_version;
  @HiveField(2)
  @JsonKey(fromJson: BaseModel.fromJsonDateTime, toJson: BaseModel.toJsonDateTime)
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
  factory Stk_Qoh.fromJson(Map<String, dynamic> json) => _$Stk_QohFromJson(json);
  Map<String, dynamic> toJson() => _$Stk_QohToJson(this);
}