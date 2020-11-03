import 'package:hive/hive.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'Stk_Qoh_Detail.g.dart';

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

  Stk_Qoh_Detail.fromJSON(Map<String, dynamic> json) {
    this.ID = json["ID"] ?? null;
    this.ID_stk_qoh = json["ID_stk_qoh"] ?? null;
    this.rfid_code = json["rfid_code"] ?? null;
    this.qoh_qty = json["qoh_qty"] ?? null;

  }
}