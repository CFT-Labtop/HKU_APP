import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import '../Util/Global.dart';
import '../Widget/StandardEditText.dart';
import '../Widget/StandardGridViewBox.dart';


class AllOrder extends StatefulWidget {
  AllOrder({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AllOrderState createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order").tr(),
          backgroundColor: Global.mainColor,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, //横轴三个子widget
              childAspectRatio: 2.0 //宽高比为1时，子widget
              ),
          children: <Widget>[
            StandardGridViewBox(
                title: 'Chemical Waste'.tr(),
                fontSize: 30,
                icon: Icons.delete_forever,
                iconColor: Colors.red,
                padding: 15.0,
                contentPadding: 10.0,
                outlineColor: Colors.red),
            StandardGridViewBox(
                title: 'Dangerous Goods'.tr(),
                fontSize: 30,
                icon: Icons.report,
                iconColor: Colors.amber,
                padding: 15.0,
                contentPadding: 10.0,
                outlineColor: Colors.amber),
            StandardGridViewBox(
                title: 'Liquid Nitrogen'.tr(),
                fontSize: 30,
                icon: Icons.kitchen,
                iconColor: Colors.blue,
                padding: 15.0,
                contentPadding: 10.0,
                outlineColor: Colors.blue),
          ],
        ));
  }
}
