import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hku_app/Util/Global.dart';

abstract class BaseTable<T> extends StatefulWidget {
  List<T> data = [];
  bool showCheckBox;
  Future<dynamic> Function(T data) onRowPress;
  BaseTable(this.data, {Key key, this.onRowPress, this.showCheckBox = false}) : super(key: key);

  List<ColumnObject<T>> getColumnObject();

  @override
  BaseTableState<T> createState() => BaseTableState<T>();
}

class BaseTableState<T> extends State<BaseTable<T>> {
  List<SortStatus> sortStatusList = [];
  int sortIndex;

  List<HeaderCell> generateHeaderView() {
    return List<HeaderCell>.generate(
        getColumnNumber(),
        (int index) => HeaderCell(
              title: Text(
                widget.getColumnObject()[index].title,
                style: TextStyle(color: Colors.white),
              ),
              isSortIndex: (sortIndex == index),
              sortStatus: sortStatusList[index],
              columnIndex: index,
              onPressed: (columnIndex, sortStatus) {
                setState(() {
                  sortIndex = columnIndex;
                  sortStatusList[columnIndex] = sortStatus;
                  if (sortStatusList[columnIndex] == SortStatus.ASCENDINNG)
                    widget.data.sort((a, b) => (widget
                            .getColumnObject()[index]
                            .getCellValue(b))
                        .compareTo(
                            widget.getColumnObject()[index].getCellValue(a)));
                  else
                    widget.data.sort((a, b) => (widget
                            .getColumnObject()[index]
                            .getCellValue(a))
                        .compareTo(
                            widget.getColumnObject()[index].getCellValue(b)));
                });
              },
            ));
  }

  List<TableCell> generateTableCell(int index) {
    return List<TableCell>.generate(
        getColumnNumber(),
        (index) => new TableCell(
            title:
                widget.getColumnObject()[index].getCellValue(widget.data[0]) ??
                    ""));
  }

  int getColumnNumber() {
    return widget.getColumnObject().length;
  }

  void initSortStatus() {
    this.sortStatusList = List<SortStatus>.generate(
        getColumnNumber(), (index) => SortStatus.DESCENDINNG);
    this.sortStatusList[0] = SortStatus.ASCENDINNG;
    this.sortIndex = 0;
  }

  @override
  void initState() {
    super.initState();
    this.initSortStatus();
  }

  List<Widget> _generateRow(int index) {
    if (widget.showCheckBox) {
      List<Widget> widgetList = List<Widget>.generate(
          getColumnNumber(),
          (columnIndex) => TableCell(
              title: widget
                  .getColumnObject()[columnIndex]
                  .getCellValue(widget.data[index])));
      widgetList.insert(
          0,
          Checkbox(
            value: true,
            onChanged: (isChecked) {

            },
          ));
      return widgetList;
    } else
      return List<Widget>.generate(
          getColumnNumber(),
          (columnIndex) => TableCell(
              title: widget
                  .getColumnObject()[columnIndex]
                  .getCellValue(widget.data[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: generateHeaderView()),
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
                    children: _generateRow(index),
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
  final Widget title;
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
              this.widget.title,
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

class TableCell extends StatelessWidget {
  final String title;

  TableCell({Key key, @required this.title}) : super(key: key);

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

class ColumnObject<T> {
  String title;
  String Function(T data) getCellValue;

  ColumnObject({@required this.title, @required this.getCellValue});
}
