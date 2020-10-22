import 'package:fluro/fluro.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Screen/AllOrder.dart';
import 'package:hku_app/Screen/LoginPage.dart';
import 'package:hku_app/Screen/OrderDetail.dart';

class Routes {
  static FluroRouter router;
  static void configureRoutes(FluroRouter router) {
    router.define("/" + Pages.LoginPage.toString(),
        handler: Handler(handlerFunc: (context, params) => LoginPage()));
    router.define("/" + Pages.OrderDetail.toString() + "/:orderID/:type",
        handler: Handler(handlerFunc: (context, params) {
          int orderID = int.parse(params["orderID"][0]);
          DeliveryType type;
          switch(params["type"][0]){
            case "DeliveryType.ChemicalWaste":
              type = DeliveryType.ChemicalWaste;
              break;
            case "DeliveryType.ChemicalWaste":
              type = DeliveryType.DangerousGoods;
              break;
            case "DeliveryType.LiquidNitrogen":
              type = DeliveryType.LiquidNitrogen;
              break;
          }
          return  OrderDetail(orderID: orderID, type: type,);
        }));
    router.define("/" + Pages.AllOrder.toString(),
        handler: Handler(handlerFunc: (context, params) => AllOrder()));
    Routes.router = router;
  }

  static Future goToDetailPage(BuildContext context, int orderID, DeliveryType type) {
    String path = "/" + orderID.toString() + "/" + type.toString();
    Routes.goToPage(context, Pages.OrderDetail, parameters: path);
  }

  static Future goToPage(BuildContext context, Pages page,{TransitionType type, bool clear = false, String parameters = ""}) {
    router.navigateTo(context, "/" + page.toString() + parameters,
        transition: type ?? TransitionType.native,
        replace: false,
        clearStack: clear);
  }
}

enum Pages {
  LoginPage,
  OrderDetail,
  AllOrder,
}
