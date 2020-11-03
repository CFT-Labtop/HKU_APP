import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Model/Version.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseFutureBuilder.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Util/Request.dart';
import 'package:hku_app/Widget/LabelRow.dart';
import 'package:hku_app/Widget/StandardBox.dart';
import 'package:hku_app/Widget/StockTakeTable.dart';

class StockTakePage extends StatefulWidget {
  @override
  _StockTakePageState createState() => _StockTakePageState();
}

class _StockTakePageState extends State<StockTakePage> {
  Version currentVersion = null;

  @override
  void initState() {
    currentVersion = Version.getLatestVersion();
  }

  Widget _stockTakeHeader() {
    return (currentVersion != null)
        ? Column(
            children: [
              StandardBox(
                title: "Information".tr(),
                children: [
                  LabelRow(
                    label: "Version".tr(),
                    value: currentVersion.version_name,
                  ),
                  SizedBox(
                    height: Global.responsiveSize(context, 8.0),
                  ),
                  LabelRow(
                    label: "QOH Date".tr(),
                    value: Global.dateFormat(currentVersion.qoh_date),
                  ),
                  SizedBox(
                    height: Global.responsiveSize(context, 8.0),
                  ),
                  LabelRow(
                    label: "Created By".tr(),
                    value: currentVersion.create_user,
                  ),
                ],
              ),
            ],
          )
        : Center(
            child: Text("No Stock Take or No Internet Connection"),
          );
  }

  List<Location> getLocation() {
    return BaseDataBase()
        .getAll<Location>()
        .where((element) => currentVersion.take_location.contains(element.ID))
        .toList();
  }

  Widget _contentWidget() {
    try {
      return Column(children: [
        _stockTakeHeader(),
        Expanded(
          child: StockTakeTable(getLocation(), onRowPress: (data) async {}),
        )
      ]);
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Stock Take".tr(),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.cloud_download),

              onPressed: (currentVersion.ID == null)? null: () async {},
            ),
            IconButton(
                icon: Icon(Icons.sync),
                onPressed: (currentVersion.ID == null)? null: () {
                  List<Location> locationList = getLocation();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return AlertDialog(
                                title: Text("Download Selected Location").tr(),
                                content: Container(
                                  height: Global.ratioHeight(context, 0.8),
                                  width: Global.ratioWidth(context, 0.8),
                                  child: ListView.builder(
                                    itemCount: locationList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CheckboxListTile(
                                          title: Text(locationList[index]
                                              .location_name),
                                          value: locationList[index].isCheck,
                                          onChanged: (isCheck) {
                                            setState(() {
                                              locationList[index].isCheck =
                                                  isCheck;
                                            });
                                          });
                                    },
                                  ),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: new Text("Cancel"),
                                  ),
                                  new FlatButton(
                                    onPressed: () {
                                      Request().getQoh(currentVersion.ID, locationList.where((element) => (element.isCheck) as bool).map((e) => e.ID).toList());
                                    },
                                    child: new Text("Confirm"),
                                  ),
                                ]);
                          },
                        );
                      });
                })
          ],
        ),
        body: BaseFutureBuilder(
          future: Request().getStockTake(),
          loadingCallback: () => _contentWidget(),
          onSuccessCallback: (response) => _contentWidget(),
          onErrorCallback: (error) => _contentWidget(),
        ),
      );
    } catch (e) {
      return Scaffold(
          body: Center(child: Text("No Stock Take or No Internet Connection")));
    }
  }
}
