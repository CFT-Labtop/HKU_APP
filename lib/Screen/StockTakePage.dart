import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Model/Stk_Tk.dart';
import 'package:hku_app/Model/Stk_Tk_Detail.dart';
import 'package:hku_app/Model/Version.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/BaseFutureBuilder.dart';
import 'package:hku_app/Util/BaseRouter.dart';
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
  List<int> download_id_list = [];

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
    if (currentVersion != null)
      return BaseDataBase()
          .getAll<Location>()
          .where((element) => currentVersion.take_location.contains(element.ID))
          .map((element){
            element.isCheck = currentVersion.downloaded_location.contains(element.ID);
            download_id_list = currentVersion.downloaded_location;
            return element;
          })
          .toList();
    return [];
  }

  Widget _contentWidget() {
    try {
      return Column(children: [
        _stockTakeHeader(),
        Expanded(
          child: StockTakeTable(getLocation(), onRowPress: (data) async {
            BaseRouter.goToStockDetailPage(context, data.ID, currentVersion.ID);
          }),
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
              icon: Icon(Icons.sync),
              onPressed: (currentVersion == null)
                  ? null
                  : () async {
                      try {
                        List<Stk_Tk> stk_list = BaseDataBase().getAll<Stk_Tk>();
                        List<Stk_Tk_Detail> stk_detail_list = BaseDataBase().getAll<Stk_Tk_Detail>();
                        await Request().uploadStockTake(context, stk_tk_list: stk_list, detail_List: stk_detail_list);
                        Global.showToast("Upload Successfully");
                      } catch (e) {
                        Global.showAlertDialog(context, e.toString());
                      }
                    },
            ),
            IconButton(
                icon: Icon(Icons.cloud_download),
                onPressed: (currentVersion == null)
                    ? null
                    : () {
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
                                        height:Global.ratioHeight(context, 0.8),
                                        width: Global.ratioWidth(context, 0.8),
                                        child: ListView.builder(
                                          itemCount: locationList.length,
                                          itemBuilder: (BuildContext context,int index) {
                                            return CheckboxListTile(
                                                title: Text(locationList[index].location_code + " " +locationList[index].store_no),
                                                value:locationList[index].isCheck,
                                                onChanged: download_id_list.contains(locationList[index].ID)?null: (isCheck) {
                                                  setState(() {
                                                    locationList[index].isCheck = isCheck;
                                                  });
                                                }
                                              );
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
                                          onPressed: () async {
                                            try{
                                              await Request().getQoh(context,
                                                versionID: currentVersion.ID,
                                                locationIDList: locationList.where((element) => (element.isCheck && !download_id_list.contains(element.ID)) as bool).map((e) => e.ID).toList()
                                              );
                                              Navigator.pop(context);
                                              currentVersion.downloaded_location = locationList.where((element) => element.isCheck).map((e) => e.ID).toList();
                                              await BaseDataBase().save(currentVersion);
                                              Global.showToast('Download Successfully');
                                            }catch(e){
                                              Global.showAlertDialog(context, e.toString());
                                            }
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
          onSuccessCallback: (response) {
            return _contentWidget();
          },
          onErrorCallback: (error) => _contentWidget(),
        ),
      );
    } catch (e) {
      return Scaffold(
          body: Center(child: Text("No Stock Take or No Internet Connection")));
    }
  }
}
