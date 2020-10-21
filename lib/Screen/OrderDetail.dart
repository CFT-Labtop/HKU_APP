import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import '../Util/Global.dart';

import '../Model/Dangerous_Goods_Order.dart';
import '../Model/Dangerous_Goods_Order_Detail.dart';

// void main() => runApp(
//     new MaterialApp( debugShowCheckedModeBanner: false, home: OrderDetail()));
void main() {
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('zh', 'HK')
      ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: OrderDetail()));
}

class OrderDetail extends StatefulWidget {
  _OrderDetail createState() => _OrderDetail();
}

class _OrderDetail extends State<OrderDetail> {
  File _image;
  final picker = ImagePicker();
  String orderType = "Dangerous_Goods_Order";
  String orderDeatiType = "Dangerous_Goods_Order_Detail";
  String orderIDType = "ID_dangerous_goods_order";
  Color orderColor = Colors.amberAccent;
  int orderID = 5243;
  Dangerous_Goods_Order _information;
  List<Dangerous_Goods_Order_Detail> _detail;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> testData = {
      "data": {
        "Information": {
          "ID_department": 9,
          "department_code": "CON",
          "department_name": "Clinical Oncology",
          "ID_account": 113,
          "ac_name": "Clinical Oncology - A/C 002",
          "hospital_price": 0,
          "ref_no": "DGO-005243",
          "po_date": "2020-09-25 12:00:00",
          "requested_by": "Michelle",
          "telephone_no": "39176937",
          "ac_no": "10212.292160000.921600.21600.400.01",
          "user": "Michelle",
          "building": "FMB L6-02",
          "issued_by": "Priscilla",
          "voucher": 0,
          "remarks": "",
          "status": 0,
          "dn_file": "[]",
          "modify_user": "admin",
          "isDeleted": 0,
          "createdDate": null,
          "modifiedDate": null,
          "ID": 5243
        },
        "Detail": [
          {
            "ID_dangerous_goods_order": 5243,
            "ID_dangerous_goods": 47,
            "ID_stock_inventory": 77,
            "ID_stock_inventory_detail": [],
            "pickedQuantity": 0,
            "article_no": "20821",
            "location": "CYM C08",
            "shelf": "",
            "rfid_code": null,
            "pick_dept_code": "CONMG",
            "product_name": "Ethanol Absolute AR",
            "unit_price": 110,
            "quantity": 4,
            "volume": 2.5,
            "unit": "L",
            "amount": 0,
            "product_brand": "VWR",
            "createdDate": null,
            "modifiedDate": null,
            "ID": 9840,
            "isDeleted": null
          },
          {
            "ID_dangerous_goods_order": 5243,
            "ID_dangerous_goods": 6,
            "ID_stock_inventory": 67,
            "ID_stock_inventory_detail": [],
            "pickedQuantity": 0,
            "article_no": "4341",
            "location": "FMB N2",
            "shelf": "",
            "rfid_code": "353",
            "pick_dept_code": "CONMG",
            "product_name": "Xylene",
            "unit_price": 145,
            "quantity": 4,
            "volume": 2.5,
            "unit": "L",
            "amount": 0,
            "product_brand": "DUKSAN",
            "createdDate": null,
            "modifiedDate": null,
            "ID": 9841,
            "isDeleted": null
          },
          {
            "ID_dangerous_goods_order": 5243,
            "ID_dangerous_goods": 4,
            "ID_stock_inventory": 1104,
            "ID_stock_inventory_detail": [],
            "pickedQuantity": 0,
            "article_no": "E14583",
            "location": "PC D",
            "shelf": "",
            "rfid_code": "777",
            "pick_dept_code": "CONMG",
            "product_name": "Ethanol 95%",
            "unit_price": 700,
            "quantity": 1,
            "volume": 20,
            "unit": "L",
            "amount": 0,
            "product_brand": "UC",
            "createdDate": null,
            "modifiedDate": null,
            "ID": 9842,
            "isDeleted": null
          }
        ]
      }
    };
    // Global.requestGet("get_order_detail", {
    //   "type": orderType,
    //   "class": orderDeatiType,
    //   "column": orderIDType,
    //   "value": orderID
    // }).then((value) {
    //   isLoading = false;
    //   _information = new Dangerous_Goods_Order(value.data["Information"]);
    //   _detail = value.data["Detail"].map<Dangerous_Goods_Order_Detail>((f) {
    //     return new Dangerous_Goods_Order_Detail(f);
    //   }).toList();
    // _information = new Dangerous_Goods_Order.fromJSON(testData["data"]["Information"]);
    // _detail = testData["data"]["Detail"].map<Dangerous_Goods_Order_Detail>((f) {
    //   return new Dangerous_Goods_Order_Detail(f);
    // }).toList();
    // rowList = [];
    // rowList.add(header);
    // for (var i = 0; i < _detail.length; i++) {
    //   rowList.add(Divider(
    //     color: Colors.grey,
    //     thickness: 0.5,
    //   ));
    //   rowList.add(Row(
    //     children: [
    //       Expanded(
    //           child:
    //               Text(_detail[i].product_name, style: TextStyle(fontSize: 11))
    //                   .tr()),
    //       Expanded(
    //           child: Text(_detail[i].quantity.toString(),
    //                   style: TextStyle(fontSize: 11))
    //               .tr())
    //     ],
    //   ));
    // }
    // setState(() {});
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(orderType),
        ),
        body: (false)
            ? SizedBox()
            : ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(Global.responsiveSize(context, 8)),
                    child: Card(
                        child: Padding(
                      padding:
                          EdgeInsets.all(Global.responsiveSize(context, 18)),
                      child: Column(
                        children: [
                          cardHeader(context, "Information", orderColor),
                          // halfRow("Ref. No.", _information.ref_no, "PO Date",
                          //     _information.po_date.substring(0, 10)),
                          halfRow("Department", _information.department_code,
                              "Requested By", _information.requested_by),
                          halfRow("Building", _information.building,
                              "Telephone", _information.telephone_no),
                          halfRow("Account", _information.ac_no),
                        ],
                      ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Global.responsiveSize(context, 8)),
                    child: Card(
                        child: Padding(
                      padding:
                          EdgeInsets.all(Global.responsiveSize(context, 18)),
                      child: Column(
                        children: [
                          cardHeader(context, "Detail", orderColor),
                          Column(children: rowList),
                        ],
                      ),
                    )),
                  ),
                  Column(children: [
                    RawMaterialButton(
                      onPressed: getImage,
                      child: Center(
                        child: _image == null
                            ? Text('No image selected.')
                            : Image.file(_image),
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

  Row header = Row(
    children: [
      Expanded(
          child: Text("Product Name",
                  style: TextStyle(fontStyle: FontStyle.italic))
              .tr()),
      Expanded(
          child: Text("Quantity", style: TextStyle(fontStyle: FontStyle.italic))
              .tr())
    ],
  );
  List<Widget> rowList = [];
}
