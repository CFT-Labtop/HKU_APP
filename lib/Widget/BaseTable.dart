import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hku_app/Model/Dangerous_Goods_Order.dart';
import 'package:hku_app/Screen/AllOrder.dart';
import 'package:hku_app/Screen/OrderDetail.dart';
import 'package:hku_app/Util/Global.dart';

class BaseTable extends StatefulWidget {
  int sortIndex;
  List<SortStatus> sortStatusList = [
    SortStatus.ASCENDINNG,
    SortStatus.DESCENDINNG,
    SortStatus.DESCENDINNG
  ];
  BaseTable({Key key, this.sortIndex = 0}) : super(key: key);
  @override
  _BaseTableState createState() => _BaseTableState();
}

class _BaseTableState extends State<BaseTable> {
  List<Dangerous_Goods_Order> items = [
    // new Dangerous_Goods_Order({
    //   "ref_no": "DGO-005276",
    //   "department_name": "Mechanical Engineering",
    //   "building": "HW G14"
    // }),
    // new Dangerous_Goods_Order({
    //   "ref_no": "DGO-005254",
    //   "department_name": "SBMS Anatomy",
    //   "building": "FMB L1-18Ax"
    // }),
    // new Dangerous_Goods_Order({
    //   "ref_no": "DGO-005262",
    //   "department_name": "Medicine",
    //   "building": "QMH Prof Blk 317"
    // }),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeaderCell(
              title: "Ref-no",
              isSortIndex: (widget.sortIndex == 0),
              sortStatus: widget.sortStatusList[0],
              columnIndex: 0,
              onPressed: (columnIndex, sortStatus) {
                setState(() {
                  widget.sortIndex = columnIndex;
                  widget.sortStatusList[columnIndex] = sortStatus;
                });
              },
            ),
            HeaderCell(
              title: "Department",
              columnIndex: 1,
              sortStatus: widget.sortStatusList[1],
              onPressed: (columnIndex, sortStatus) {
                setState(() {
                  widget.sortIndex = columnIndex;
                  widget.sortStatusList[columnIndex] = sortStatus;
                });
              },
              isSortIndex: (widget.sortIndex == 1),
            ),
            HeaderCell(
              title: "Building",
              sortStatus: widget.sortStatusList[2],
              isSortIndex: (widget.sortIndex == 2),
              onPressed: (columnIndex, sortStatus) {
                setState(() {
                  widget.sortIndex = columnIndex;
                  widget.sortStatusList[columnIndex] = sortStatus;
                });
              },
              columnIndex: 2,
            ),
          ],
        ),
        Expanded(
          child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RawMaterialButton(
                onPressed: () { 
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OrderDetail()));
                 },
                child: Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.black45,
                      icon: Icons.more_horiz,
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                    ),
                  ],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BaseTableCell(title: items[index].ref_no),
                      BaseTableCell(title: items[index].department_name),
                      BaseTableCell(title: items[index].building),
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

class BaseTableCell extends StatelessWidget {
  final String title;
  BaseTableCell({Key key, @required this.title}) : super(key: key);
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
