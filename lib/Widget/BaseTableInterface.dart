import 'package:hku_app/Util/BaseModel.dart';

abstract class BaseTableInterface<T extends BaseModel>{
  List<T> setData();
  List<String> columnTitleField();
  List<String> columnCellValue();
  void onRowPress();
}