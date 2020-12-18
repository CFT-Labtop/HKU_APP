import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Stk_Qoh_Detail.g.dart';

@JsonSerializable()
@HiveType(typeId: 13)
class Stk_Qoh_Detail extends BaseModel{
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_stk_qoh;
  @HiveField(2)
  String rfid_code;
  @HiveField(3)
  int qoh_qty;

  @override
  int getID() => this.ID;

  Stk_Qoh_Detail({
    int this.ID,
    int this.ID_stk_qoh,
    String this.rfid_code,
    int this.qoh_qty,


  }) {}

  factory Stk_Qoh_Detail.fromJson(Map<String, dynamic> json) => _$Stk_Qoh_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Stk_Qoh_DetailToJson(this);
}