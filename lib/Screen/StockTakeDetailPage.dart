import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hku_app/Model/Location.dart';
import 'package:hku_app/Model/Stk_Qoh.dart';
import 'package:hku_app/Model/Stk_Qoh_Detail.dart';
import 'package:hku_app/Model/Stk_Tk.dart';
import 'package:hku_app/Model/Stk_Tk_Detail.dart';
import 'package:hku_app/Util/BaseDataBase.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:hku_app/Widget/LabelRow.dart';
import 'package:hku_app/Widget/StandardBox.dart';
import 'package:hku_app/Widget/StockDetailTable.dart';
import 'package:progress_dialog/progress_dialog.dart';

class StockTakeDetailPage extends StatefulWidget {
  int versionID;
  int locationID;

  StockTakeDetailPage({Key key, @required this.versionID, @required this.locationID}): super(key: key);

  @override
  _StockTakeDetailPageState createState() => _StockTakeDetailPageState();
}

class _StockTakeDetailPageState extends State<StockTakeDetailPage> {
  Location currentLocation;
  List<Stk_Qoh> qohList;
  List<Stk_Qoh_Detail> qohDetailList;
  TextEditingController quantityTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentLocation = BaseDataBase().get<Location>(widget.locationID);
    getQohByLocationIDAndVersionID(widget.locationID, widget.versionID);
  }

  void getQohByLocationIDAndVersionID(int locationID, int versionID) {
    qohList = BaseDataBase()
        .getAll<Stk_Qoh>()
        .where((element) =>
            element.ID_version == widget.versionID &&
            element.ID_location == locationID)
        .toList();
    List<int> QohIDList = qohList.map((e) => e.ID).toList();
    qohDetailList = BaseDataBase()
        .getAll<Stk_Qoh_Detail>()
        .where((element) => QohIDList.contains(element.ID_stk_qoh))
        .toList();
  }

  Future<void> insertStkTakeDetail(Stk_Qoh_Detail qoh_detail, int quantity) async {
    ProgressDialog pr = ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false);
    try{
      await pr.show();
      Stk_Qoh qoh = BaseDataBase().get<Stk_Qoh>(qoh_detail.ID_stk_qoh);
      Stk_Tk stk_tk = BaseDataBase().getAll<Stk_Tk>().firstWhere((element) => element.ID_qoh == qoh.ID, orElse: () => null);
      if (stk_tk == null) stk_tk = await Stk_Tk.insertByQoh(qoh);
      Stk_Tk_Detail stk_detail = Stk_Tk_Detail.getDetailByRfid(qoh_detail.rfid_code);
      if(stk_detail == null)
        await Stk_Tk_Detail.insertByQOHDetail(stk_tk,qoh_detail, quantity);
      else
        stk_detail.updateQuantity(quantity);
      await stk_tk.updateQuantity();
      await pr.hide();
      Navigator.pop(context);
      Global.showToast("Successfully");
    }catch(e){
      await pr.hide();
      Global.showAlertDialog(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
            title: Text("Stock Take Detail".tr()),
            actions: [
              IconButton(icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  
                });
              },)
            ]),
        body: Column(
          children: [
            StandardBox(
              title: "Detail".tr(),
              children: [
                LabelRow(
                  label: "Location".tr(),
                  value: currentLocation.location_name,
                ),
                SizedBox(
                  height: Global.responsiveSize(context, 8.0),
                ),
                LabelRow(
                  label: "Store no".tr(),
                  value: currentLocation.store_no,
                ),
              ],
            ),
            Expanded(
              child: StockTakeDetailTable(
                qohDetailList,
                onRowPress: (data) async {
                  showPlatformDialog(
                    context: context,
                    builder: (_) => PlatformAlertDialog(
                      title: Text("Stock Take").tr(),
                      content: Column(
                        children: [
                          LabelRow(label: "RFID", value: data.rfid_code),
                          LabelRow(
                              label: "Quantity",
                              value: data.qoh_qty.toString()),
                          Text("Actual Quantity"),
                          PlatformTextField(
                              controller: quantityTextController,
                              keyboardType: TextInputType.number)
                        ],
                      ),
                      actions: <Widget>[
                        PlatformDialogAction(
                          child: PlatformText('Cancel'.tr()),
                          onPressed: () => Navigator.pop(context),
                        ),
                        PlatformDialogAction(
                          child: PlatformText('Confirm'.tr()),
                          onPressed: () async {
                              await insertStkTakeDetail(data, int.parse(quantityTextController.text));
                              quantityTextController.text = "";
                              setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    } catch (e) {
      return Scaffold(
        body: Center(
          child: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    quantityTextController.dispose();
    super.dispose();
  }
}
