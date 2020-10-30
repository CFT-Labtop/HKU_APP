import 'package:flutter/material.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseModel.dart';
import 'package:hku_app/Widget/BaseTableInterface.dart';
import 'package:hku_app/Widget/BaseTableTemp.dart';

class TestTable extends BaseTableTemp{
  TestTable(List<OrderInterface> data, {Future<void> Function(OrderInterface data) onRowPress} ) : super(data, onRowPress: onRowPress);

  @override
  void test() {
  }


}
