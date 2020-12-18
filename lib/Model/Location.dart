import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:hku_app/Util/Checkable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Location.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class Location extends BaseModel with Checkable{
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

factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}