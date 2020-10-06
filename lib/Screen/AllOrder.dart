import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

void main() => runApp(
    new MaterialApp(debugShowCheckedModeBanner: false, home: AllOrder()));

class AllOrder extends StatefulWidget {
  _AllOrder createState() => _AllOrder();
}

class _AllOrder extends State<AllOrder> {
  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();
    // var currentButtons = UnicornButton(currentButton: ,)

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Choo choo",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.train),
          onPressed: () {},
        )));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.airplanemode_active))));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car))));

    return Scaffold(
        floatingActionButton: UnicornDialer(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
            parentButtonBackground: Colors.redAccent,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(Icons.add),
            childButtons: childButtons),
        appBar: AppBar(),
        body: Center(child: RaisedButton(
          onPressed: () {
            setState(() {});
          },
        )));
  }
}
