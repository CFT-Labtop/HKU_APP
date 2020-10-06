import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../Util/Global.dart';

class StandardGridViewBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double fontSize;
  final Color outlineColor;
  final double outlineWidth;
  final Color boxColor;
  final double padding;
  final double contentPadding;
  StandardGridViewBox(
      {Key key,
      @required this.title,
      this.icon,
      this.fontSize = 20.0,
      this.iconSize = 72.0,
      this.iconColor = Global.mainColor,
      this.outlineColor = Global.mainColor,
      this.outlineWidth = 2.0,
      this.boxColor = Colors.white,
      this.padding = 0,
      this.contentPadding = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(this.padding),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: this.boxColor,
            border: Border.all(
                width: Global.responsiveSize(context, this.outlineWidth), //
                color: this.outlineColor),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (this.icon != null)
                  ? Icon(
                      this.icon,
                      color: this.iconColor,
                      size: Global.responsiveSize(context, this.iconSize),
                    )
                  : SizedBox(),
              SizedBox(
                width: Global.responsiveSize(context, this.contentPadding),
              ),
              Text(
                this.title,
                style: TextStyle(fontSize: this.fontSize, fontFamily: "VT323"),
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
