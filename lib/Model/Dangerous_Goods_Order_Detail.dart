import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:hku_app/Model/OrderDetailInterface.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Dangerous_Goods_Order_Detail.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Dangerous_Goods_Order_Detail extends BaseModel implements OrderDetailInterface {
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_dangerous_goods_order;
  @HiveField(2)
  int ID_dangerous_goods;
  @HiveField(3)
  int ID_stock_inventory;
  @HiveField(4)
  @JsonKey(fromJson: BaseModel.fromJsonIntList)
  List<int> ID_stock_inventory_detail;
  @HiveField(5)
  String article_no;
  @HiveField(6)
  String location;
  @HiveField(7)
  String shelf;
  @HiveField(8)
  String rfid_code;
  @HiveField(9)
  String pick_dept_code;
  @HiveField(10)
  String product_name;
  @HiveField(11)
  double unit_price;
  @HiveField(12)
  double quantity;
  @HiveField(13)
  int pickedQuantity;
  @HiveField(14)
  double volume;
  @HiveField(15)
  String unit;
  @HiveField(16)
  @JsonKey(fromJson: BaseModel.fromJsonBool, toJson: BaseModel.toJsonBool)
  bool amount;
  @HiveField(17)
  String product_brand;

  Dangerous_Goods_Order_Detail(
      {int this.ID,
      int this.ID_dangerous_goods_order,
      int this.ID_dangerous_goods,
      int this.ID_stock_inventory,
      List<int> this.ID_stock_inventory_detail,
      String this.article_no,
      String this.location,
      String this.shelf,
      String this.rfid_code,
      String this.pick_dept_code,
      String this.product_name,
      double this.unit_price,
      double this.quantity,
      int this.pickedQuantity,
      double this.volume,
      String this.unit,
      bool this.amount,
      String this.product_brand}) {}
  @override
  int getID() => this.ID;

  @override
  String getProductName() => this.product_name;

  @override
  double getQuantity() => this.quantity;

  factory Dangerous_Goods_Order_Detail.fromJson(Map<String, dynamic> json) => _$Dangerous_Goods_Order_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Dangerous_Goods_Order_DetailToJson(this);
}
