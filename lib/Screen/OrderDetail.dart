import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Enums/DeliveryType.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/Chemical_Waste_Order_Detail.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order_Detail.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order.dart';
import 'package:hku_app/Model/Liquid_Nitrogen_Order_Detail.dart';
import 'package:hku_app/Model/OrderDetailInterface.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseResponse.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class OrderDetail extends StatefulWidget {
  int orderID;
  DeliveryType type;

  OrderDetail({Key key, this.orderID, this.type}) : super(key: key);

  _OrderDetail createState() => _OrderDetail();
}

class _OrderDetail extends State<OrderDetail> {
  List<File> imageList = [null, null, null];
  OrderInterface orderData;
  List<OrderDetailInterface> orderDetailList;
  final picker = ImagePicker();

  String orderTitle() {
    return this.widget.type.value + " Order";
  }

  Widget imageBox(File file, int index){
    return RawMaterialButton(
      onPressed: () async{
        await getImage(index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Global.responsiveSize(context, 24.0)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all()
          ),
          width: double.infinity,
          height: Global.responsiveSize(context, 400.0),
          child: file == null ? SizedBox(): Image.file(file, fit: BoxFit.cover,),
        ),
      ),
    );
    return Image.file(file);
  }

  Future<void> getImage(int index) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    imageList[index] = File(pickedFile.path);
    await orderData.updatePhotoList(imageList);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    switch (this.widget.type) {
      case DeliveryType.ChemicalWaste:
        this.orderData =
            BaseDataBase().get<Chemical_Waste_Order>(this.widget.orderID);
        this.orderDetailList = BaseDataBase()
            .getAll<Chemical_Waste_Order_Detail>()
            .where((element) =>
                element.ID_chemical_waste_order == this.widget.orderID)
            .toList()
            .cast<OrderDetailInterface>();
        break;
      case DeliveryType.LiquidNitrogen:
        this.orderData =
            BaseDataBase().get<Liquid_Nitrogen_Order>(this.widget.orderID);
        this.orderDetailList = BaseDataBase()
            .getAll<Liquid_Nitrogen_Order_Detail>()
            .where((element) =>
                element.ID_liquid_nitrogen_order == this.widget.orderID)
            .toList()
            .cast<OrderDetailInterface>();
        break;
      case DeliveryType.DangerousGoods:
        this.orderData =
            BaseDataBase().get<Dangerous_Goods_Order>(this.widget.orderID);
        this.orderDetailList = BaseDataBase()
            .getAll<Dangerous_Goods_Order_Detail>()
            .where((element) =>
                element.ID_dangerous_goods_order == this.widget.orderID)
            .toList()
            .cast<OrderDetailInterface>();
        break;
    }

    this.orderData.getDNLocal().then((value){
      this.imageList = value;
      setState(() {});
    });
  }

  Widget orderDetailWidget() {
    return Column(
      children: [
        cardHeader(context, "Detail".tr(), Colors.amberAccent),
        Column(
            children: this.orderDetailList.map((element) {
          return Column(
            children: [
              halfRow("Product Name".tr(), element.getProductName() ?? "",
                  "Quantity".tr(), element.getQuantity().toString() ?? ""),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ],
          );
        }).toList()),
      ],
    );
  }

  Widget orderInformationWidget() {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(Global.responsiveSize(context, 18)),
      child: Column(
        children: [
          cardHeader(context, "Information".tr(), Colors.amberAccent),
          halfRow("Ref. No.".tr(), this.orderData.getRefNo() ?? "", "PO Date",
              Global.dateFormat(this.orderData.getPODate() ?? "")),
          halfRow("Department".tr(), this.orderData.getDepartmentCode() ?? "",
              "Requested By".tr(), this.orderData.getRequestedBy() ?? ""),
          halfRow("Building".tr(), this.orderData.getBuilding() ?? "",
              "Telephone".tr(), this.orderData.getTelephone() ?? ""),
          halfRow("Account", this.orderData.getAccountNumber() ?? ""),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(orderTitle()),
          actions: [IconButton(icon: Icon(Icons.cloud_upload), onPressed: () async {
            ProgressDialog pr = ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false);
            try{
              pr.show();
              await Future.forEach(this.imageList, (element) async {
                if(element != null)
                  await Request().uploadDNPhoto(context, ID: this.orderData.getID(), type: this.orderData.getType(), ref_no: this.orderData.getRefNo(), seq: Global.generateRandomString(10), file: element);
              });
              pr.hide();
            }on DioError catch(e){
              pr.hide();
              Global.showAlertDialog(context, e.message);
            }
          },)],
        ),
        body: (false)
            ? SizedBox()
            : ListView(
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.all(Global.responsiveSize(context, 8)),
                      child: orderInformationWidget()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Global.responsiveSize(context, 8)),
                    child: Card(
                        child: Padding(
                      padding:
                          EdgeInsets.all(Global.responsiveSize(context, 18)),
                      child: orderDetailWidget(),
                    )),
                  ),
                  Column(children: [
                    Center(
                      child: Column(
                        children: [
                          imageBox(imageList[0],0),
                          imageBox(imageList[1],1),
                          imageBox(imageList[2],2),
                        ],
                      ),
                    )
                  ])
                ],
              ));
  }

  Row halfRow(String title1, String value1,
      [String title2 = "", String value2 = ""]) {
    return Row(
      children: [
        Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [new Text(title1 + ": " + value1).tr()]),
        ),
        (title2 != "" && value2 != "")
            ? Expanded(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [new Text(title2 + ": " + value2).tr()]),
              )
            : SizedBox()
      ],
    );
  }

  Column cardHeader(BuildContext context, String title, Color color) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Global.responsiveSize(context, 18)),
          ).tr(),
        ],
      ),
      Divider(
        color: color,
        thickness: Global.responsiveSize(context, 2),
      ),
    ]);
  }
}
