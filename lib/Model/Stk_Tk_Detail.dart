import 'package:hive/hive.dart';
import 'package:hku_app/Model/Stk_Qoh_Detail.dart';
import 'package:hku_app/Model/Stk_Tk.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Stk_Tk_Detail.g.dart';

@JsonSerializable()
@HiveType(typeId: 15)
class Stk_Tk_Detail extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_stk_tk;
  @HiveField(2)
  String rfid_code;
  @HiveField(3)
  int stk_tk_qty;
  @HiveField(4)
  @JsonKey(fromJson: BaseModel.fromJsonBool, toJson: BaseModel.toJsonBool)
  bool newRecord;

  @override
  int getID() => this.ID;

  Stk_Tk_Detail({
    int this.ID,
    int this.ID_stk_tk,
    String this.rfid_code,
    int this.stk_tk_qty,
    bool this.newRecord,
  }) {}

  Map<String, dynamic> toJSON()=>{
    "ID": this.ID,
    "ID_stk_tk": this.ID_stk_tk,
    "rfid_code": this.rfid_code,
    "stk_tk_qty": this.stk_tk_qty,
    "newRecord": this.newRecord,
  };

  static Future<Stk_Tk_Detail> insertByQOHDetail(Stk_Tk stk_tk, Stk_Qoh_Detail qoh_detail, int quantity) async {
    int id = BaseDataBase().getHighestID<Stk_Tk_Detail>() + 1;
    await BaseDataBase().add<Stk_Tk_Detail>(new Stk_Tk_Detail(
        ID: id,
        ID_stk_tk: stk_tk.ID,
        rfid_code: qoh_detail.rfid_code,
        stk_tk_qty: quantity,
        newRecord: false));
  }

  static Stk_Tk_Detail getDetailByRfid(String rfid_code)  {
    return BaseDataBase().getAll<Stk_Tk_Detail>().firstWhere((element) => element.rfid_code == rfid_code, orElse: ()=>null);
  }

  void updateQuantity(int quantity){
    this.stk_tk_qty = quantity;
    BaseDataBase().save<Stk_Tk_Detail>(this);
  }

  factory Stk_Tk_Detail.fromJson(Map<String, dynamic> json) => _$Stk_Tk_DetailFromJson(json);
  Map<String, dynamic> toJson() => _$Stk_Tk_DetailToJson(this);
}
