import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/Chemical_Waste_Order_Detail.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order_Detail.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order_Detail.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseFutureBuilder.dart';
import 'package:hku_app/Util/BaseResponse.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Util/Routes.dart';
import 'package:hku_app/Widget/BaseTable.dart';
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

  Widget orderTable(){
    return Expanded(child: BaseTable(getOrderByData(currentSelectedDate), onRowPress: (data){
      Routes.goToDetailPage(context, data.getID(), data.getType());
    },));
  }

  Future<void >addOrderData(BaseResponse response) async{
    List<Dangerous_Goods_Order> dangerous_goods_order_list =
        response.data["Dangerous_Goods_Order"].map<Dangerous_Goods_Order>((f) {
      return new Dangerous_Goods_Order.fromJSON(f);
    }).toList();
    List<Dangerous_Goods_Order_Detail> dangerous_goods_order_detail_list =
        response.data["Dangerous_Goods_Order_Detail"]
            .map<Dangerous_Goods_Order_Detail>((f) {
      return new Dangerous_Goods_Order_Detail.fromJSON(f);
    }).toList();
    List<Liquid_Nitrogen_Order> liquid_nitrogen_order_list =
        response.data["Liquid_Nitrogen_Order"].map<Liquid_Nitrogen_Order>((f) {
      return new Liquid_Nitrogen_Order.fromJSON(f);
    }).toList();
    List<Liquid_Nitrogen_Order_Detail> liquid_nitrogen_order_detail_list =
        response.data["Liquid_Nitrogen_Order_Detail"]
            .map<Liquid_Nitrogen_Order_Detail>((f) {
      return new Liquid_Nitrogen_Order_Detail.fromJSON(f);
    }).toList();
    List<Chemical_Waste_Order> chemical_waste_order_list =
        response.data["Chemical_Waste_Order"].map<Chemical_Waste_Order>((f) {
      return new Chemical_Waste_Order.fromJSON(f);
    }).toList();
    List<Chemical_Waste_Order_Detail> chemical_waste_order_detail_list =
        response.data["Chemical_Waste_Order_Detail"]
            .map<Chemical_Waste_Order_Detail>((f) {
      return new Chemical_Waste_Order_Detail.fromJSON(f);
    }).toList();
    dangerous_goods_order_list
        .where((element) => element.status == 0)
        .forEach((element) async {
      await BaseDataBase().add<Dangerous_Goods_Order>(element);
    });
    liquid_nitrogen_order_list
        .where((element) => element.status == 0)
        .forEach((element) {
      BaseDataBase().add<Liquid_Nitrogen_Order>(element);
    });
    chemical_waste_order_list
        .where((element) => element.status == 0)
        .forEach((element) async {
      await BaseDataBase().add<Chemical_Waste_Order>(element);
    });
    dangerous_goods_order_detail_list.forEach((element) async {
      await BaseDataBase().add<Dangerous_Goods_Order_Detail>(element);
    });
    liquid_nitrogen_order_detail_list.forEach((element) async {
      await BaseDataBase().add<Liquid_Nitrogen_Order_Detail>(element);
    });
    chemical_waste_order_detail_list.forEach((element) async {
      await BaseDataBase().add<Chemical_Waste_Order_Detail>(element);
    });
  }

  List<OrderInterface> getOrderByData(DateTime date){
    switch(currentType){
      case DeliveryType.ChemicalWaste:
        return BaseDataBase().getAll<Chemical_Waste_Order>().where((element) => Global.dateFormat(element.po_date) == Global.dateFormat(this.currentSelectedDate)).toList();
      case DeliveryType.LiquidNitrogen:
        return BaseDataBase().getAll<Liquid_Nitrogen_Order>().where((element) => Global.dateFormat(element.po_date) == Global.dateFormat(this.currentSelectedDate)).toList();
      case DeliveryType.DangerousGoods:
        return BaseDataBase().getAll<Dangerous_Goods_Order>().where((element) => Global.dateFormat(element.po_date) == Global.dateFormat(this.currentSelectedDate)).toList();
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
      ),
      body: Column(
        children: [
          _dateSelectField(),
          BaseFutureBuilder(
            future: Request().get(action: "mobile_duty_sheet", queryParameters: {"date": Global.dateFormat(this.currentSelectedDate)}),
            loadingCallback: () {
              return orderTable();
            },
            onSuccessCallback: (response) {
              addOrderData(response);
              return orderTable();
            },
            onErrorCallback: (e){
              return orderTable();
            },
            
          ),
        ],
      ),
    );
  }
}
