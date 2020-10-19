import 'package:fluro/fluro.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hku_app/Screen/AllOrder.dart';
import 'package:hku_app/Screen/LoginPage.dart';
import 'package:hku_app/Screen/OrderDetail.dart';

class Routes {
  static FluroRouter router;
  static void configureRoutes(FluroRouter router) {
    router.define(Pages.LoginPage.toString(),
        handler: Handler(handlerFunc: (context, params) => LoginPage()));
    router.define(Pages.OrderDetail.toString(),
        handler:
            Handler(handlerFunc: (context, params) => OrderDetail()));
    router.define(Pages.AllOrder.toString(),
        handler: Handler(handlerFunc: (context, params) => AllOrder()));
    Routes.router = router;
  }
  static Future goToPage(BuildContext context, Pages page,
      {TransitionType type, bool clear = false}) {
    router.navigateTo(context, page.toString(),
        transition: type ?? TransitionType.cupertino,
        replace: false,
        clearStack: clear);
  }
}

enum Pages {
  LoginPage,
  OrderDetail,
  AllOrder,
}
