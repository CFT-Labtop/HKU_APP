import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Util/Global.dart';

class LabelRow extends StatelessWidget {
  String label;
  String value;

  LabelRow({@required this.label, @required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(this.label??"", style: TextStyle(fontSize: Global.responsiveSize(context, 16.0, ), fontWeight: FontWeight.bold),).tr(),
        Text(" : "),
        Text(this.value??"", style: TextStyle(fontSize: Global.responsiveSize(context, 16.0, )) ).tr(),
      ],
    );
  }
}
