import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Chemical_Waste_Order_Detail.g.dart';

@HiveType(typeId: 5)
class Chemical_Waste_Order_Detail extends BaseModel {
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

  Chemical_Waste_Order_Detail.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.ID_chemical_waste_order = json["ID_chemical_waste_order"] ?? null;
    this.waste_code = json["waste_code"] ?? null;
    this.medical_waste = json["medical_waste"] ?? null;
    this.container_no = json["container_no"] ?? null;
    this.capacity = json["capacity"] ?? null;
    this.capacity_unit = json["capacity_unit"] ?? null;
    this.capacity_volume = json["capacity_volume"] ?? null;
    this.collected_unit = json["collected_unit"] ?? null;
    this.shortName = json["shortName"] ?? null;
  }
}
