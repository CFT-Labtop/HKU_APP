import 'package:hive/hive.dart';

abstract class BaseModel extends HiveObject{
  int getID();
}