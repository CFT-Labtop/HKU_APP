import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hku_app/Model/OrderInterface.dart';
import 'package:hku_app/Util/Global.dart';
import 'package:easy_localization/easy_localization.dart';

//TODO Componentize
 abstract class BaseTableTemp extends StatefulWidget {
  List<OrderInterface> data = [];
  Future<void> Function(OrderInterface data) onRowPress;
  void test();
  BaseTableTemp( this.data, {Key key, this.onRowPress})
      :super(key: key);
  @override
  _BaseTableTempState createState() => _BaseTableTempState();
}

class _BaseTableTempState extends State<BaseTableTemp> {
  List<SortStatus> sortStatusList = [
    SortStatus.ASCENDINNG,
    SortStatus.DESCENDINNG,
    SortStatus.DESCENDINNG
  ];
  int sortIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeaderCell(
              title: "Ref-no".tr(),
              isSortIndex: (sortIndex == 0),
              sortStatus: sortStatusList[0],
              columnIndex: 0,
              onPressed: (columnIndex, sortStatus)
              {
                widget.test();
                setState(() {
                  sortIndex = columnIndex;
                  sortStatusList[columnIndex] = sortStatus;
                  if (sortStatusList[columnIndex] ==
                      SortStatus.ASCENDINNG)
                    widget.data.sort((a, b) => (b.getRefNo()).compareTo(a.getRefNo()));
                  else
                    widget.data.sort((a, b) => (a.getRefNo()).compareTo(b.getRefNo()));
                });
              },
            ),
            HeaderCell(
              title: "Department".tr(),
              columnIndex: 1,
              sortStatus: sortStatusList[1],
              onPressed: (columnIndex, sortStatus) {
                setState(() {
                  sortIndex = columnIndex;
                  sortStatusList[columnIndex] = sortStatus;
                  if (sortStatusList[columnIndex] ==
                      SortStatus.ASCENDINNG)
                    widget.data.sort((a, b) => (b.getDepartmentName()).compareTo(a.getDepartmentName()));
                  else
                    widget.data.sort((a, b) => (a.getDepartmentName()).compareTo(b.getDepartmentName()));
                });
              },
              isSortIndex: (sortIndex == 1),
            ),
            HeaderCell(
              title: "Building".tr(),
              sortStatus: sortStatusList[2],
              isSortIndex: (sortIndex == 2),
              onPressed: (columnIndex, sortStatus) {
                setState(() {
                  sortIndex = columnIndex;
                  sortStatusList[columnIndex] = sortStatus;
                });
              },
              columnIndex: 2,
            ),
          ],
        ),
        Expanded(
          child: new ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return RawMaterialButton(
                onPressed: () async {
                  await this.widget.onRowPress(widget.data[index]);
                },
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BaseTableTempCell(title: widget.data[index].getRefNo() ?? ""),
                      BaseTableTempCell(title: widget.data[index].getDepartmentName() ?? ""),
                      BaseTableTempCell(title: widget.data[index].getBuilding()?? ""),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class HeaderCell extends StatefulWidget {
  final String title;
  final void Function(int columnIndex, SortStatus sortStatus) onPressed;
  final int columnIndex;
  final bool isSortIndex;
  SortStatus sortStatus;
  HeaderCell(
      {Key key,
        @required this.title,
        @required this.onPressed,
        this.sortStatus = SortStatus.ASCENDINNG,
        this.columnIndex,
        this.isSortIndex = false})
      : super(key: key);

  @override
  _HeaderCellState createState() => _HeaderCellState();
}

class _HeaderCellState extends State<HeaderCell> {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Container(
        height: Global.responsiveSize(context, 40.0),
        decoration: BoxDecoration(
            color: Colors.grey, border: Border.all(color: Colors.grey)),
        child: RawMaterialButton(
          onPressed: () {
            setState(() {
              widget.sortStatus = (widget.sortStatus == SortStatus.ASCENDINNG)
                  ? SortStatus.DESCENDINNG
                  : SortStatus.ASCENDINNG;
            });
            widget.onPressed(widget.columnIndex, widget.sortStatus);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.widget.title,
                style: TextStyle(color: Colors.white),
              ),
              (this.widget.isSortIndex)
                  ? (this.widget.sortStatus == SortStatus.ASCENDINNG)
                  ? Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
              )
                  : Icon(Icons.keyboard_arrow_down, color: Colors.white)
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class BaseTableTempCell extends StatelessWidget {
  final String title;
  BaseTableTempCell({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        height: Global.responsiveSize(context, 48.0),
        child: Text(
          this.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

enum SortStatus { ASCENDINNG, DESCENDINNG }
