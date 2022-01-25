
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:hku_app/Screen/LoginPage.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/Config.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Util/BaseRouter.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async {
  final router = new FluroRouter();
  BaseRouter.configureRoutes(router);
  Request.init(Config.baseURL);
  await BaseDataBase().init();
  Global.sharedPreferences = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();
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
      onGenerateRoute: BaseRouter.router.generator
    );
  }
}