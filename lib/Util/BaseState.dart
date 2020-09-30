import 'package:flutter/material.dart';
abstract class BaseState <T extends StatefulWidget> extends State<T>{
  static double smallPadSize = 768;
  static double padSize = 1024;
  static double phoneRate = 1;
  static double smallPadRate = 1.2;
  static double padRate = 1.5;
  double resposiveSize(BuildContext context, double size){
    double screenWidth = MediaQuery.of(context).size.width;
    if(screenWidth <= smallPadSize)
      return size * phoneRate;
    else if(screenWidth <= padRate)
      return size * smallPadRate;
    else
      return size * padRate;
  }
}