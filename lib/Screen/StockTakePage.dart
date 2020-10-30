import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Widget/LabelRow.dart';
import 'package:hku_app/Widget/StandardBox.dart';

class StockTakePage extends StatefulWidget {
  @override
  _StockTakePageState createState() => _StockTakePageState();
}

class _StockTakePageState extends State<StockTakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Stock Take".tr(),
      )),
      body: Column(
        children: [
          StandardBox(
            title: "Information".tr(),
            children: [
              LabelRow(
                label: "Version".tr(),
                value: "20201020Test",
              ),
              SizedBox(height: Global.responsiveSize(context, 8.0),),
              LabelRow(
                label: "QOH Date".tr(),
                value: "2020-10-20",
              ),
              SizedBox(height: Global.responsiveSize(context, 8.0),),
              LabelRow(
                label: "Created By".tr(),
                value: "Admin",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
