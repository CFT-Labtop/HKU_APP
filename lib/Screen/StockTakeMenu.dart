import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Util/Global.dart';
import 'package:hku_app/Widget/BaseTable.dart';

class StockTakeMenu extends StatefulWidget {
  StockTakeMenu({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _StockTakeMenuState createState() => _StockTakeMenuState();
}

class _StockTakeMenuState extends State<StockTakeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Stock Take").tr(), backgroundColor: Global.mainColor),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Global.responsiveSize(context, 8)),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(Global.responsiveSize(context, 18)),
                  child: Column(
                    children: [Text('Stock Take').tr()],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
