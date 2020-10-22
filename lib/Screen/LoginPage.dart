import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Model/Chemical_Waste_Order.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Routes.dart';
import 'package:hku_app/Widget/StandardEditText.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: SafeArea(
        bottom: false,
        child: Container(
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
                height: Global.responsiveSize(context, 24.0),
              ),
              RaisedButton.icon(
                onPressed: () async {
                  Routes.goToPage(context, Pages.AllOrder);
                },
                color: Colors.white,
                icon: Icon(Icons.send),
                label: Text("LoginPage",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ])),
      ),
    );
  }
}