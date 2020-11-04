import 'package:flutter/cupertino.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Model/Stk_Qoh.dart';
import 'package:hku_app/Model/Stk_Qoh_Detail.dart';
import 'package:hku_app/Model/Stk_Tk.dart';
import 'package:hku_app/Model/Stk_Tk_Detail.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Widget/BaseTable.dart';
import 'package:easy_localization/easy_localization.dart';

class StockTakeDetailTable extends BaseTable<Stk_Qoh_Detail> {
  StockTakeDetailTable(List<Stk_Qoh_Detail> data,
      {Future<void> Function(Stk_Qoh_Detail data) onRowPress,
      GlobalKey<BaseTableState> key})
      : super(data, onRowPress: onRowPress, key: key);

  @override
  List<ColumnObject<Stk_Qoh_Detail>> getColumnObject() {

    return [
      new ColumnObject<Stk_Qoh_Detail>(getCellValue: (data) => data.rfid_code, title: "RFID".tr()),
      new ColumnObject<Stk_Qoh_Detail>(getCellValue: (data) => BaseDataBase().get<Stk_Qoh>(data.ID_stk_qoh).product_name, title: "Item Name".tr()),
      new ColumnObject<Stk_Qoh_Detail>(getCellValue: (data) => data.qoh_qty.toString(), title: "QTY".tr()),
      new ColumnObject<Stk_Qoh_Detail>(getCellValue: (data) {
        try{
          Stk_Qoh qoh = BaseDataBase().get<Stk_Qoh>(data.ID_stk_qoh);
          Stk_Tk stk_tk = BaseDataBase().getAll<Stk_Tk>().firstWhere((element) => element.ID_qoh == qoh.ID);
          Stk_Tk_Detail stk_detail = BaseDataBase().getAll<Stk_Tk_Detail>().firstWhere((element) => element.rfid_code == data.rfid_code);
          return stk_detail.stk_tk_qty.toString();
        }catch(e){
          return "0";
        }
      }, title: "TK(QTY)".tr()),
    ];
  }
}
