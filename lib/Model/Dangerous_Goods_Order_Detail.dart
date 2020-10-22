import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Dangerous_Goods_Order_Detail.g.dart';

@HiveType(typeId: 3)
class Dangerous_Goods_Order_Detail extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_dangerous_goods_order;
  @HiveField(2)
  int ID_dangerous_goods;
  @HiveField(3)
  int ID_stock_inventory;
  @HiveField(4)
  String ID_stock_inventory_detail;
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
  String amount;
  @HiveField(17)
  String product_brand;

  Dangerous_Goods_Order_Detail(
      {int this.ID,
      int this.ID_dangerous_goods_order,
      int this.ID_dangerous_goods,
      int this.ID_stock_inventory,
      String this.ID_stock_inventory_detail,
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
      String this.amount,
      String this.product_brand}) {}

  Dangerous_Goods_Order_Detail.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.ID_dangerous_goods_order =
        json["departmeID_dangerous_goods_ordernt_code"] ?? null;
    this.ID_dangerous_goods = json["ID_dangerous_goods"] ?? null;
    this.ID_stock_inventory = json["ID_stock_inventory"] ?? null;
    // this.ID_stock_inventory_detail = json["ID_stock_inventory_detail"] ?? null;
    this.article_no = json["article_no"] ?? null;
    this.location = json["location"] ?? null;
    this.shelf = json["shelf"] ?? null;
    this.rfid_code = json["rfid_code"] ?? null;
    this.pick_dept_code = json["pick_dept_code"] ?? null;
    this.product_name = json["product_name"] ?? null;
    this.unit_price = json["unit_price"] ?? null;
    this.quantity = json["quantity"] ?? null;
    this.pickedQuantity = json["pickedQuantity"] ?? null;
    this.volume = json["volume"] ?? null;
    this.unit = json["unit"] ?? null;
    this.amount = json["amount"] ?? null;
    this.product_brand = json["product_brand"] ?? null;
  }
}
