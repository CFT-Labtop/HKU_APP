import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import '../Util/Global.dart';
import '../Util/BaseState.dart';

final router = Router();

class Test extends StatefulWidget {
  Test({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TestState createState() => _TestState();
}

class _TestState extends BaseState<Test> {
  @override
  Widget header() {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.5,
      child: Container(
        color: Colors.green,
        child: Center(
            child: Text(
          "HKU" + '\n' + "Safety Office",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: resposiveSize(context, 40.0),
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ).tr()),
      ),
    );
  }

  Widget standardEditText(String title,
      {double fontSize = 48, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff969696),
          ),
        ).tr(),
        TextField(
            obscureText: obscureText,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Global.mainColor, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff969696), width: 2.0),
                  borderRadius: BorderRadius.circular(12.0)),
            )),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Flexible(child: header()),
      SizedBox(
        height: 48,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: resposiveSize(context, 24.0)),
        child: standardEditText("Password", obscureText: true),
      ),
      Text(context.locale.toString()),
      RaisedButton(
        onPressed: () {},
        child: Text('Disabled Button',
            style: TextStyle(fontSize: resposiveSize(context, 20.0))),
      ),
    ]));
  }
}
