import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Widget/BaseTable.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderTable extends BaseTableTemp<OrderInterface> {
  OrderTable(List<OrderInterface> data,
      {Future<void> Function(OrderInterface data) onRowPress})
      : super(data, onRowPress: onRowPress);

  @override
  List<ColumnObject<OrderInterface>> getColumnObject() {
    return [new ColumnObject<OrderInterface>(getCellValue: (data) => data.getRefNo(), title: "Ref-No".tr()),new ColumnObject<OrderInterface>(getCellValue: (data) => data.getDepartmentName(), title: "Department".tr()), new ColumnObject<OrderInterface>(getCellValue: (data) => data.getBuilding(), title: "Building".tr())];
  }

  @override
  String getCellValue(data, int index) {
    return this.getColumnObject()[index].getCellValue(data);
  }
}
