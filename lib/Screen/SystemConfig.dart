import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Widget/StandardEditText.dart';
import 'package:hku_app/Util/SharedPreferenceExtension.dart';

class SystemConfig extends StatefulWidget {
  _SystemConfigState createState() => _SystemConfigState();
}

class _SystemConfigState extends State<SystemConfig> {
  final baseURLController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.baseURLController.text = Global.sharedPreferences.getString('baseURL');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System Config").tr(),
        actions: [],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Global.responsiveSize(context, 24.0),
            vertical: Global.responsiveSize(context, 24.0),
          ),
          child: ListView(children: <Widget>[
            StandardEditText(
              title: "BaseURL".tr(),
              textColor: Colors.black,
              controller: baseURLController,
              outlineColor: Global.secondOutlineColor,
            ),
            SizedBox(
              height: Global.responsiveSize(context, 24.0),
            ),
            RaisedButton.icon(
              onPressed: () async {
                Global.sharedPreferences
                    .setString("baseURL", baseURLController.text);
                Global.showAlertDialog(context, 'Updated Success',
                    title: 'Alert');
              },
              color: Colors.white,
              icon: Icon(Icons.save),
              label: Text("Save".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ])),
    );
  }
}
