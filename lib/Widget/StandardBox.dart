import 'package:flutter/material.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:easy_localization/easy_localization.dart';

class StandardBox extends StatelessWidget {
  String title;
  List<Widget> children;

  StandardBox({@required this.title, this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Global.responsiveSize(context, 18)),
        child: Column(
          children: [
            cardHeader(context, this.title.tr(), Colors.amberAccent),
            Column(
              children: this.children ?? [],
            )
          ],
        ),
      ),
    );
  }

  Column cardHeader(BuildContext context, String title, Color color) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Global.responsiveSize(context, 18)),
          ).tr(),
        ],
      ),
      Divider(
        color: color,
        thickness: Global.responsiveSize(context, 2),
      ),
    ]);
  }
}
