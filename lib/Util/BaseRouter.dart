import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Screen/AllOrder.dart';
import 'package:hku_app/Screen/LoginPage.dart';
import 'package:hku_app/Screen/OrderDetail.dart';
import 'package:hku_app/Screen/QRCodeScanPage.dart';
import 'package:hku_app/Screen/StockTakeDetailPage.dart';
import 'package:hku_app/Screen/StockTakePage.dart';
import 'package:hku_app/Screen/SystemConfig.dart';

class BaseRouter {
  static FluroRouter router;

  static void configureRoutes(FluroRouter router) {
    router.define("/" + Pages.LoginPage.toString(),
        handler: Handler(handlerFunc: (context, params) => LoginPage()));
    router.define("/" + Pages.OrderDetail.toString() + "/:orderID/:type",
        handler: Handler(handlerFunc: (context, params) {
      int orderID = int.parse(params["orderID"][0]);
      DeliveryType type;
      switch (params["type"][0]) {
        case "DeliveryType.ChemicalWaste":
          type = DeliveryType.ChemicalWaste;
          break;
        case "DeliveryType.DangerousGoods":
          type = DeliveryType.DangerousGoods;
          break;
        case "DeliveryType.LiquidNitrogen":
          type = DeliveryType.LiquidNitrogen;
          break;
      }
      return OrderDetail(
        orderID: orderID,
        type: type,
      );
    }));
    router.define("/" + Pages.AllOrder.toString(),
        handler: Handler(handlerFunc: (context, params) => AllOrder()));
    router.define("/" + Pages.QRCodeScanPage.toString(),
        handler: Handler(handlerFunc: (context, params) => QRCodeScanPage()));
    router.define("/" + Pages.StockTakePage.toString(),
        handler: Handler(handlerFunc: (context, params) => StockTakePage()));
    router.define(
        "/" + Pages.StockTakeDetailPage.toString() + "/:locationID/:versionID",
        handler: Handler(handlerFunc: (context, params) {
      int locationID = int.parse(params["locationID"][0]);
      int versionID = int.parse(params["versionID"][0]);
      return StockTakeDetailPage(
        locationID: locationID,
        versionID: versionID,
      );
    }));
    router.define("/" + Pages.SystemConfig.toString(),
        handler: Handler(handlerFunc: (context, params) => SystemConfig()));
    BaseRouter.router = router;
  }

  static Future<void> goToStockDetailPage(
      BuildContext context, int locationID, int versionID) async {
    String path = "/" + locationID.toString() + "/" + versionID.toString();
    await BaseRouter.goToPage(context, Pages.StockTakeDetailPage,
        parameters: path);
  }

  static Future<void> goToOrderDetailPage(
      BuildContext context, int orderID, DeliveryType type) async {
    String path = "/" + orderID.toString() + "/" + type.toString();
    await BaseRouter.goToPage(context, Pages.OrderDetail, parameters: path);
  }

  static Future<dynamic> goToPage(BuildContext context, Pages page,
      {TransitionType type, bool clear = false, String parameters = ""}) async {
    return await router.navigateTo(context, "/" + page.toString() + parameters,
        transition: type ?? TransitionType.native,
        replace: false,
        clearStack: clear);
  }
}

enum Pages {
  LoginPage,
  OrderDetail,
  AllOrder,
  QRCodeScanPage,
  StockTakePage,
  StockTakeDetailPage,
  SystemConfig
}
