import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../Util/Global.dart';

class StandardEditText extends StatelessWidget {
  final String title;
  final double fontSize;
  final bool obscureText;
  final Color focusedOutlineColor;
  StandardEditText(
      {Key key,
      @required this.title,
      this.fontSize = 48,
      this.obscureText = false,
      this.focusedOutlineColor = Global.mainColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ).tr(),
        TextField(
            obscureText: obscureText,
            style: TextStyle(fontSize: 24, color: Colors.white),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: focusedOutlineColor, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(12.0)),
            )),
      ],
    );
  }
}
