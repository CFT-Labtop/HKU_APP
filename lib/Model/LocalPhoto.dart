import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseModel.dart';

part 'LocalPhoto.g.dart';

@HiveType(typeId: 9)
class LocalPhoto extends BaseModel {
  @HiveField(0)
  int ID;
  @HiveField(1)
  DeliveryType type;
  @HiveField(2)
  List<File> photoList;
  @HiveField(3)
  int orderID;

  int getID() => this.ID;

  LocalPhoto({int this.ID,
    DeliveryType this.type,
    List<File> this.photoList,
    int this.orderID,
  }) {}
}
