import 'package:flutter/material.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Widget/BaseTable.dart';
import 'package:easy_localization/easy_localization.dart';

class StockTakeTable extends BaseTable<Location> {
  StockTakeTable(List<Location> data, {Future<void> Function(Location data) onRowPress, GlobalKey<BaseTableState> key}) : super(data, onRowPress: onRowPress, key: key);

  @override
  List<ColumnObject<Location>> getColumnObject() {
    return [new ColumnObject<Location>(getCellValue: (data) => data.location_code, title: "Code".tr()),new ColumnObject<Location>(getCellValue: (data) => data.location_name, title: "Location Name".tr()), new ColumnObject<Location>(getCellValue: (data) => data.store_no, title: "Store".tr())];
  }
}
