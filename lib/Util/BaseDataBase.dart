import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Util/BaseModel.dart';
class BaseDataBase<T extends BaseModel>{

  static final BaseDataBase _baseDataBase = BaseDataBase._internal();
  Map<String, Box> box_map = new Map();
  Box<Dangerous_Goods_Order> dangerous_goods_order_box;
  BaseDataBase._internal();
  factory BaseDataBase() => _baseDataBase;

 Future<void> init() async{
   await Hive.initFlutter();
   Hive.registerAdapter(DangerousGoodsOrderAdapter()); 
   box_map["Dangerous_Goods_Order"] = await Hive.openBox("Dangerous_Goods_Order");
 }

 List<T> getAll<T extends BaseModel>(int ID){
   return box_map[T.toString()].values.toList().cast<T>();
 }

 T get<T extends BaseModel>(int ID){
   return box_map[T.toString()].get(ID);
 }

  void add<T extends BaseModel>(T model){
    box_map[T.toString()].put(model.ID, model);
  }

  void save<T extends BaseModel>(T model){
    model.save();
  }
  
  void delete<T extends BaseModel>(T model){
    model.delete();
  }
 
}