
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:hku_app/Screen/LoginPage.dart';
import 'Util/Config.dart';
import 'Util/Global.dart';
import 'Util/Request.dart';
import 'Util/Routes.dart';
void main() {
  final router = new FluroRouter();
  Routes.configureRoutes(router);
  Request.init(Config.baseURL);
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