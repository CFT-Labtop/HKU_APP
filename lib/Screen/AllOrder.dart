import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hku_app/Widget/BaseTable.dart';
import 'package:hku_app/Widget/Unicorndial.dart';

// void main() => runApp(
//     new MaterialApp( debugShowCheckedModeBanner: false, home: AllOrder()));
void main() {
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('zh', 'HK')
      ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: AllOrder()));
}

class User {
  User(this.name, this.age);

  final String name;
  final int age;
}

class AllOrder extends StatefulWidget {
  _AllOrder createState() => _AllOrder();
}

class _AllOrder extends State<AllOrder> {
  var currentType = "1234";
  var _sortAscending = true;
  var _sortColumnIndex = 0;
  List<User> data = [
    User('老孟', 18),
    User('老孟1', 19),
    User('老孟2', 20),
    User('老孟3', 21),
    User('老孟4', 22),
  ];

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Chemical Waste".tr(),
        currentButton: FloatingActionButton(
            heroTag: "Chemical Waste".tr(),
            backgroundColor: Colors.redAccent,
            mini: true,
            child: Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                currentType = "Chemical Waste".tr();
              });
              print(currentType);
            })));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Dangerous Goods".tr(),
        currentButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                currentType = "Dangerous Goods".tr();
              });
              print(currentType);
            },
            heroTag: "Dangerous Goods".tr(),
            backgroundColor: Colors.amberAccent,
            mini: true,
            child: Icon(Icons.report))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Liquid Nitrogen".tr(),
        currentButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                currentType = "Liquid Nitrogen".tr();
              });
              print(currentType);
            },
            heroTag: "Liquid Nitrogen".tr(),
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.kitchen))));

    return Scaffold(
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      appBar: AppBar(
        title: Text(currentType),
      ),
      body: BaseTable(),
      // body: DataTable(
      //     sortColumnIndex: _sortColumnIndex,
      //     sortAscending: _sortAscending,
      //     columns: [
      //       DataColumn(
      //           label: Text('姓名'),
      //           onSort: (int columnIndex, bool ascending) {
      //             setState(() {
      //               _sortColumnIndex = columnIndex;
      //               _sortAscending = ascending;
      //               if (ascending) {
      //                 data.sort((a, b) => a.name.compareTo(b.name));
      //               } else {
      //                 data.sort((a, b) => b.name.compareTo(a.name));
      //               }
      //             });
      //           }),
      //       DataColumn(
      //           label: Text('年龄'),
      //           onSort: (int columnIndex, bool ascending) {
      //             setState(() {
      //               _sortColumnIndex = columnIndex;
      //               _sortAscending = ascending;
      //               if (ascending) {
      //                 data.sort((a, b) => a.age.compareTo(b.age));
      //               } else {
      //                 data.sort((a, b) => b.age.compareTo(a.age));
      //               }
      //             });
      //           }),
      //     ],
      //     rows: data.map((user) {
      //       return DataRow(cells: [
      //         DataCell(Container(width: 300.0, child: Text('${user.name}'))),
      //         DataCell(Text('${user.age}')),
      //       ]);
      //     }).toList()),
    );
  }
}
