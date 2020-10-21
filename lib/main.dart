
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Screen/LoginPage.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/Config.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Util/Routes.dart';
Future<void> main() async {
  final router = new FluroRouter();
  Routes.configureRoutes(router);
  Request.init(Config.baseURL);
  await BaseDataBase().init();
  BaseDataBase().add<Dangerous_Goods_Order>(Dangerous_Goods_Order(ID: 1, department_name: "Testing"));
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('zh', 'HK')
      ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: RouterPage()));
}

class RouterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HKU',
      theme: ThemeData(
        primaryColor: Global.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: Routes.router.generator
    );
  }
}