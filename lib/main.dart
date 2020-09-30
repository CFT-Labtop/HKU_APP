import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

import 'Util/Global.dart';
import 'Util/BaseState.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN'), Locale('zh', 'HK')],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HKU',
      theme: ThemeData(
        primaryColor: Global.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> {
  @override
  Widget header() {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.5,
      child: Container(
        color: Colors.green,
        child: Center(
            child: Text(
          "HKU",
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
        height: resposiveSize(context, 48.0),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: resposiveSize(context, 24.0)),
        child: standardEditText("User Code"),
      ),
      SizedBox(
        height: 48,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: resposiveSize(context, 24.0)),
        child: standardEditText("Password", obscureText: true),
      ),
      Text(
        context.locale.toString()
      ),
      RaisedButton(
        onPressed: () {},
        child: Text('Disabled Button', style: TextStyle(fontSize: resposiveSize(context, 20.0))),
      ),
    ]));
  }
}
