import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseFutureBuilder.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Widget/BaseTable.dart';
import 'package:hku_app/Widget/Unicorndial.dart';

class AllOrder extends StatefulWidget {
  _AllOrder createState() => _AllOrder();
}

class _AllOrder extends State<AllOrder> {
  DeliveryType currentType = DeliveryType.ChemicalWaste;
  String currentSelectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
  }
  Widget _dateSelectField() {
    return RawMaterialButton(
      onPressed: () {
        DatePicker.showDatePicker(context, onConfirm: (date) {
          setState(() {
            currentSelectedDate = DateFormat('yyyy-MM-dd').format(date);
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
              currentSelectedDate,
              style: TextStyle(fontSize: Global.responsiveSize(context, 24.0)),
            ),
            Icon(Icons.edit, color: Colors.blue)
          ],
        ),
      ),
    );
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
                      print(currentType);
                    },
                    heroTag: "Liquid Nitrogen".tr(),
                    backgroundColor: Colors.blueAccent,
                    mini: true,
                    child: Icon(Icons.kitchen)))
          ]),
      appBar: AppBar(
        title: Text(currentType.value, style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          _dateSelectField(),
          BaseFutureBuilder(
            future: Request().get(action: "mobile_duty_sheet", queryParameters: {"date": this.currentSelectedDate}),
            onSuccessCallback: (response){
              List<Dangerous_Goods_Order> dangerous_goods_order_list  = response.data["Dangerous_Goods_Order"].map<Dangerous_Goods_Order>((f) {return new Dangerous_Goods_Order.fromJSON(f);}).toList();
              dangerous_goods_order_list.forEach((element) {
                BaseDataBase().add<Dangerous_Goods_Order>(element);
              });
            },
            child: Expanded(child: BaseTable())),
        ],
      ),
    );
  }
}
