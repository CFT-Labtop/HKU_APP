import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Location.g.dart';

@HiveType(typeId: 10)
class Location extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  String location_code;
  @HiveField(2)
  String location_name;
  @HiveField(3)
  String store_no;
  @HiveField(4)
  int licensed_qty1;
  @HiveField(5)
  String licensed_unit1;
  @HiveField(6)
  int licensed_qty2;
  @HiveField(7)
  String licensed_unit2;

  @override
  int getID() => this.ID;

  Location({int this.ID,
    String this.location_code,
    String this.location_name,
    String this.store_no,
    int this.licensed_qty1,
    String this.licensed_unit1,
    int this.licensed_qty2,
    String this.licensed_unit2,
    }) {}

  Location.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.location_code = json["location_code"] ?? null;
    this.location_name = json["location_name"] ?? null;
    this.store_no = json["store_no"] ?? null;
    this.licensed_qty1 = json["licensed_qty1"] ?? null;
    this.licensed_unit1 = json["licensed_unit1"] ?? null;
    this.licensed_qty2 = json["licensed_qty2"] ?? null;
    this.licensed_unit2 = json["licensed_unit2"] ?? null;
  }

}