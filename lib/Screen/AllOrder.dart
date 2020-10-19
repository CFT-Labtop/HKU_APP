import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Widget/BaseTable.dart';
import 'package:hku_app/Widget/Unicorndial.dart';

class AllOrder extends StatefulWidget {
  _AllOrder createState() => _AllOrder();
}

class _AllOrder extends State<AllOrder> {
  @override
  void initState() {
    super.initState();
  }
  var currentType = "1234";
  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Chemical Waste".tr(),
        currentButton: FloatingActionButton(
            heroTag: "Chemical Waste".tr(),
            backgroundColor: Colors.redAccent,
            mini: true,
            child: Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                currentType = "Chemical Waste".tr();
              });
              print(currentType);
            })));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Dangerous Goods".tr(),
        currentButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                currentType = "Dangerous Goods".tr();
              });
              print(currentType);
            },
            heroTag: "Dangerous Goods".tr(),
            backgroundColor: Colors.amberAccent,
            mini: true,
            child: Icon(Icons.report))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Liquid Nitrogen".tr(),
        currentButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                currentType = "Liquid Nitrogen".tr();
              });
              print(currentType);
            },
            heroTag: "Liquid Nitrogen".tr(),
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.kitchen))));

    return Scaffold(
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      appBar: AppBar(
        title: Text(currentType),
      ),
      body: BaseTable(),
    );
  }
}
