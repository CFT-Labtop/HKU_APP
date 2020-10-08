import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'Screen/Homepage.dart';
import 'Screen/AllOrder.dart';
import 'Screen/OrderDetail.dart';
import 'Util/Global.dart';
import 'Widget/StandardEditText.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('zh', 'HK')
      ],
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget header() {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.5,
      child: Container(
        color: Colors.white,
        child: Center(
            child: Text(
          "HKU" + '\n' + "Safety Office",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: Global.responsiveSize(context, 40.0),
              fontWeight: FontWeight.bold,
              color: Global.mainColor),
        ).tr()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Global.mainColor,
            child: Column(children: [
              Flexible(child: header()),
              SizedBox(
                height: Global.responsiveSize(context, 48.0),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Global.responsiveSize(context, 24.0)),
                  child: StandardEditText(
                    title: "User Code",
                    focusedOutlineColor: Global.outlineColor,
                  )),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Global.responsiveSize(context, 24.0)),
                child: StandardEditText(
                    title: "Password",
                    obscureText: true,
                    focusedOutlineColor: Global.outlineColor),
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OrderDetail()));
                },
                color: Colors.white,
                icon: Icon(Icons.send),
                label: Text("Login",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              Text(context.locale.toString()),
            ])));
  }
}
