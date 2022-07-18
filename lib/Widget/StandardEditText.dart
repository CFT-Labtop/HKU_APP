import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../Util/Global.dart';

class StandardEditText extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool obscureText;
  final TextEditingController controller;
  final Color textColor;
  final Color focusedOutlineColor;
  final Color outlineColor;
  StandardEditText({
    Key key,
    @required this.title,
    this.controller,
    this.fontSize = 48,
    this.obscureText = false,
    this.textColor = Colors.white,
    this.focusedOutlineColor = Global.mainColor,
    this.outlineColor = Global.outlineColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: textColor,
          ),
        ).tr(),
        TextField(
            obscureText: obscureText,
            controller: this.controller,
            style: TextStyle(fontSize: 24, color: textColor),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: focusedOutlineColor, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: outlineColor, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0)),
            )),
      ],
    );
  }
}
