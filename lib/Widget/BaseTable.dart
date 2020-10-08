import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BaseTable extends StatefulWidget {
  @override
  _BaseTableState createState() => _BaseTableState();
}

class _BaseTableState extends State<BaseTable> {
  final items = new List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeaderCell(),
            HeaderCell(),
            HeaderCell(),
          ],
        ),
        Expanded(
          child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () {},
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => {},
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => {},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => {},
                  ),
                ],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BaseTableCell(),
                    BaseTableCell(),
                    BaseTableCell(),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class HeaderCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Text(
          "AAAA",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BaseTableCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Container(
        height: 200.0,
        child: Text(
          "AAAA",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
