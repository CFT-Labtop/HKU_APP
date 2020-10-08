import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import '../Util/Global.dart';
import '../Widget/StandardEditText.dart';


class Test extends StatefulWidget {
  Test({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Homepage").tr(), backgroundColor: Global.mainColor),
    );
  }
}
