import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseFutureBuilder.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Util/BaseRouter.dart';
import 'package:hku_app/Widget/OrderTable.dart';
import 'package:hku_app/Widget/Unicorndial.dart';

class AllOrder extends StatefulWidget {
  _AllOrder createState() => _AllOrder();
}

class _AllOrder extends State<AllOrder> {
  DeliveryType currentType = DeliveryType.ChemicalWaste;
  DateTime currentSelectedDate = DateTime.now();

  Widget _dateSelectField() {
    return RawMaterialButton(
      onPressed: () {
        DatePicker.showDatePicker(context, onConfirm: (date) {
          setState(() {
            currentSelectedDate = date;
          });
        });
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: Global.responsiveSize(context, 8.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Global.dateFormat(currentSelectedDate),
              style: TextStyle(fontSize: Global.responsiveSize(context, 24.0)),
            ),
            Icon(Icons.edit, color: Colors.blue)
          ],
        ),
      ),
    );
  }

  Widget orderTable() {
    return Expanded(
        child: OrderTable(
      getOrderByData(currentSelectedDate),
      onRowPress: (data) async {
        await BaseRouter.goToOrderDetailPage(context, data.getID(), data.getType());
        setState(() {});
      },
    ));
  }

  List<OrderInterface> getOrderByData(DateTime date) {
    switch (currentType) {
      case DeliveryType.ChemicalWaste:
        return BaseDataBase().getAll<Chemical_Waste_Order>().where((element) => Global.dateFormat(element.po_date) == Global.dateFormat(this.currentSelectedDate)).toList();
      case DeliveryType.LiquidNitrogen:
        return BaseDataBase()
            .getAll<Liquid_Nitrogen_Order>()
            .where((element) =>
                Global.dateFormat(element.po_date) ==
                Global.dateFormat(this.currentSelectedDate))
            .toList();
      case DeliveryType.DangerousGoods:
        return BaseDataBase()
            .getAll<Dangerous_Goods_Order>()
            .where((element) =>
                Global.dateFormat(element.po_date) ==
                Global.dateFormat(this.currentSelectedDate))
            .toList();
    }
  }

  OrderInterface getOrderByRefNo(String ref_no) {
    OrderInterface result = null;
    try {
      result = BaseDataBase().getAll<Chemical_Waste_Order>().firstWhere((element) => element.ref_no == ref_no, orElse: () => null);
      if (result != null) return result;
      result = BaseDataBase()
          .getAll<Liquid_Nitrogen_Order>()
          .firstWhere((element) => element.ref_no == ref_no, orElse: () => null);
      if (result != null) return result;
      result = BaseDataBase()
          .getAll<Dangerous_Goods_Order>()
          .firstWhere((element) => element.ref_no == ref_no, orElse: () => null);
      if (result != null) return result;
    } catch (e) {
      throw Exception("Order Not Found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: <UnicornButton>[
            UnicornButton(
                hasLabel: true,
                labelText: "Chemical Waste".tr(),
                currentButton: FloatingActionButton(
                    heroTag: "Chemical Waste".tr(),
                    backgroundColor: Colors.redAccent,
                    mini: true,
                    child: Icon(Icons.delete_forever),
                    onPressed: () {
                      setState(() {
                        currentType = DeliveryType.ChemicalWaste;
                      });
                    })),
            UnicornButton(
                hasLabel: true,
                labelText: "Dangerous Goods".tr(),
                currentButton: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        currentType = DeliveryType.DangerousGoods;
                      });
                    },
                    heroTag: "Dangerous Goods".tr(),
                    backgroundColor: Colors.amberAccent,
                    mini: true,
                    child: Icon(Icons.report))),
            UnicornButton(
                hasLabel: true,
                labelText: "Liquid Nitrogen".tr(),
                currentButton: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        currentType = DeliveryType.LiquidNitrogen;
                      });
                    },
                    heroTag: "Liquid Nitrogen".tr(),
                    backgroundColor: Colors.blueAccent,
                    mini: true,
                    child: Icon(Icons.kitchen)))
          ]),
      appBar: AppBar(
        title: Text(
          currentType.value,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () async {
              try {
                String ref_no = await BaseRouter.goToPage(context, Pages.QRCodeScanPage);
                OrderInterface orderInterface = getOrderByRefNo(ref_no);
                BaseRouter.goToOrderDetailPage(context, orderInterface.getID(), orderInterface.getType());
              } catch (e) {
                Global.showAlertDialog(context, "Order Not Found Or Delivered");
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.fact_check),
            onPressed: (){
              BaseRouter.goToPage(context, Pages.StockTakePage);
            }
          )
        ],
      ),
      body: Column(
        children: [
          _dateSelectField(),
          BaseFutureBuilder(
            future: Request().getOrder(this.currentSelectedDate),
            loadingCallback: () {
              return orderTable();
            },
            onSuccessCallback: (response) {
              return orderTable();
            },
            onErrorCallback: (e) {
              return orderTable();
            },
          ),
        ],
      ),
    );
  }
}
