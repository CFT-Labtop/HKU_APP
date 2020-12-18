import 'package:hive/hive.dart';
import 'package:hku_app/Model/Stk_Qoh.dart';
import 'package:hku_app/Model/Stk_Tk_Detail.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:hku_app/Util/Checkable.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Stk_Tk.g.dart';

@JsonSerializable()
@HiveType(typeId: 14)
class Stk_Tk extends BaseModel{
  @HiveField(0)
  int ID;
  @HiveField(1)
  int ID_qoh;
  @HiveField(2)
  @JsonKey(fromJson: BaseModel.fromJsonDateTime, toJson: BaseModel.toJsonDateTime)
  DateTime stk_tk_date;
  @HiveField(3)
  int ID_location;
  @HiveField(4)
  String location_code;
  @HiveField(5)
  String location_name;
  @HiveField(6)
  String store_no;
  @HiveField(7)
  String shelf;
  @HiveField(8)
  int ID_department;
  @HiveField(9)
  String department_code;
  @HiveField(10)
  String department_name;
  @HiveField(11)
  int ID_dangerous_goods;
  @HiveField(12)
  String product_name;
  @HiveField(13)
  String article_no;
  @HiveField(14)
  int stk_tk_total_qty;
  @HiveField(15)
  String create_user;
  @HiveField(16)
  String modify_user;

  @override
  int getID() => this.ID;

  Stk_Tk({
    int this.ID,
    int this.ID_qoh,
    DateTime this.stk_tk_date,
    int this.ID_location,
    String this.location_code,
    String this.location_name,
    String this.store_no,
    String this.shelf,
    int this.ID_department,
    String this.department_code,
    String this.department_name,
    int this.ID_dangerous_goods,
    String this.product_name,
    String this.article_no,
    int this.stk_tk_total_qty,
    String this.create_user,
    String this.modify_user,

  }) {}

  static Future<Stk_Tk> insertByQoh(Stk_Qoh qoh)async{
    int id = BaseDataBase().getHighestID<Stk_Tk>() + 1;
    await BaseDataBase().add<Stk_Tk>(new Stk_Tk(
      ID: id,
      ID_qoh: qoh.ID,
      stk_tk_date: DateTime.now(),
      ID_location: qoh.ID_location,
      location_code: qoh.location_code,
      location_name: qoh.location_name,
      store_no: qoh.store_no,
      shelf: qoh.shelf,
      ID_department: qoh.ID_department,
      department_code: qoh.department_code,
      department_name: qoh.department_name,
      ID_dangerous_goods: qoh.ID_dangerous_goods,
      product_name: qoh.product_name,
      stk_tk_total_qty: 0,
      create_user: qoh.create_user,
      modify_user: qoh.modify_user,
    ));
    return BaseDataBase().get<Stk_Tk>(id);
  }
  Map<String, dynamic> toJSON()=>{
    "ID": this.ID,
    "ID_qoh": this.ID_qoh,
    "stk_tk_date": Global.dateFormat(this.stk_tk_date),
    "ID_location": this.ID_location,
    "location_code": this.location_code,
    "location_name": this.location_name,
    "store_no": this.store_no,
    "shelf": this.shelf,
    "ID_department": this.ID_department,
    "department_code": this.department_code,
    "department_name": this.department_name,
    "ID_dangerous_goods": this.ID_dangerous_goods,
    "product_name": this.product_name,
    "stk_tk_total_qty": this.stk_tk_total_qty,
    "create_user": this.create_user,
    "modify_user": this.modify_user,
  };

  Future<void> updateQuantity() async {
    this.stk_tk_total_qty = 0;
    BaseDataBase().getAll<Stk_Tk_Detail>().forEach((element) {
      this.stk_tk_total_qty += element.stk_tk_qty;
    });
    await BaseDataBase().save<Stk_Tk>(this);
  }
  factory Stk_Tk.fromJson(Map<String, dynamic> json) => _$Stk_TkFromJson(json);
  Map<String, dynamic> toJson() => _$Stk_TkToJson(this);
}