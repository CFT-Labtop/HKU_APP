import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/Chemical_Waste_Order_Detail.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order_Detail.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order_Detail.dart';
import 'package:hku_app/Model/LocalPhoto.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Model/Version.dart';
import 'package:hku_app/Util/BaseModel.dart';

class BaseDataBase<T extends BaseModel> {
  static final BaseDataBase _baseDataBase = BaseDataBase._internal();
  Map<String, Box> box_map = new Map();

  BaseDataBase._internal();

  factory BaseDataBase() => _baseDataBase;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DangerousGoodsOrderAdapter());
    Hive.registerAdapter(DangerousGoodsOrderDetailAdapter());
    Hive.registerAdapter(LiquidNitrogenOrderAdapter());
    Hive.registerAdapter(LiquidNitrogenOrderDetailAdapter());
    Hive.registerAdapter(ChemicalWasteOrderAdapter());
    Hive.registerAdapter(ChemicalWasteOrderDetailAdapter());
    Hive.registerAdapter(LocalPhotoAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(VersionAdapter());
    _baseDataBase.box_map["Dangerous_Goods_Order"] =
        await Hive.openBox("Dangerous_Goods_Order");
    _baseDataBase.box_map["Dangerous_Goods_Order_Detail"] =
        await Hive.openBox("Dangerous_Goods_Order_Detail");
    _baseDataBase.box_map["Chemical_Waste_Order"] =
        await Hive.openBox("Chemical_Waste_Order");
    _baseDataBase.box_map["Chemical_Waste_Order_Detail"] =
        await Hive.openBox("Chemical_Waste_Order_Detail");
    _baseDataBase.box_map["Liquid_Nitrogen_Order"] =
        await Hive.openBox("Liquid_Nitrogen_Order");
    _baseDataBase.box_map["Liquid_Nitrogen_Order_Detail"] =
        await Hive.openBox("Liquid_Nitrogen_Order_Detail");
    _baseDataBase.box_map["LocalPhoto"] = await Hive.openBox("LocalPhoto");
    _baseDataBase.box_map["Location"] = await Hive.openBox("Location");
    _baseDataBase.box_map["Version"] = await Hive.openBox("Version");
  }

  List<T> getAll<T extends BaseModel>() {
    return _baseDataBase.box_map[T.toString()].values.toList().cast<T>();
  }

  T get<T extends BaseModel>(int ID) {
    return _baseDataBase.box_map[T.toString()].get(ID);
  }

  Future<void> add<T extends BaseModel>(T model) async {
    await _baseDataBase.box_map[T.toString()].put(model.getID(), model);
  }

  Future<void> save<T extends BaseModel>(T model) async {
    await _baseDataBase.box_map[T.toString()].put(model.getID(), model);
  }

  Future<void> deleteAll<T extends BaseModel>() async {
    await _baseDataBase.box_map[T.toString()].deleteFromDisk();
  }

  Future<void> delete<T extends BaseModel>(T model) async {
    await _baseDataBase.box_map[T.toString()].delete(model.getID());
  }
}
