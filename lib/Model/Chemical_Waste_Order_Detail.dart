import 'package:hive/hive.dart';
import 'package:hku_app/Model/OrderDetailInterface.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Chemical_Waste_Order_Detail.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class Chemical_Waste_Order_Detail extends BaseModel implements OrderDetailInterface  {
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_chemical_waste_order;
  @HiveField(2)
  String waste_code;
  @HiveField(3)
  String waste_type;
  @HiveField(4)
  int medical_waste;
  @HiveField(5)
  int container_no;
  @HiveField(6)
  int capacity;
  @HiveField(7)
  String capacity_unit;
  @HiveField(8)
  int capacity_volume;
  @HiveField(9)
  String collected_unit;
  @HiveField(10)
  String shortName;

  @override
  int getID() => this.ID;

  Chemical_Waste_Order_Detail(
      {int this.ID,
      int this.ID_chemical_waste_order,
      String this.waste_code,
      String this.waste_type,
      int this.medical_waste,
      int this.container_no,
      int this.capacity,
      String this.capacity_unit,
      int this.capacity_volume,
      String this.collected_unit,
      String this.shortName}) {}

  @override
  String getProductName() => this.waste_type;

  @override
  double getQuantity() => this.container_no.toDouble();

  factory Chemical_Waste_Order_Detail.fromJson(Map<String, dynamic> json) => _$Chemical_Waste_Order_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Chemical_Waste_Order_DetailToJson(this);
}
