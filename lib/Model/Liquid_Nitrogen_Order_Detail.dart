import 'package:hive/hive.dart';
import 'package:hku_app/Model/OrderDetailInterface.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Liquid_Nitrogen_Order_Detail.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class Liquid_Nitrogen_Order_Detail extends BaseModel implements OrderDetailInterface  {
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_liquid_nitrogen_order;
  @HiveField(2)
  String article_no;
  @HiveField(3)
  String product_name;
  @HiveField(4)
  int volume;
  @HiveField(5)
  double unit_price;
  @HiveField(6)
  String stock_data_entered;

  @override
  int getID() => this.ID;

  Liquid_Nitrogen_Order_Detail(
      {int this.ID,
      int this.ID_liquid_nitrogen_order,
      String this.article_no,
      String this.product_name,
      int this.volume,
      double this.unit_price,
      String this.stock_data_entered}) {}

  @override
  String getProductName() => this.product_name;

  @override
  double getQuantity() => this.volume.toDouble();

  factory Liquid_Nitrogen_Order_Detail.fromJson(Map<String, dynamic> json) => _$Liquid_Nitrogen_Order_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Liquid_Nitrogen_Order_DetailToJson(this);
}
