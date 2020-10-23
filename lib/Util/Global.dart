import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart';

class Global {
  static const Color mainColor = Color.fromRGBO(0, 179, 141, 1);
  static const Color outlineColor = Colors.white;
  static const Color focusedOutlineColor = Colors.white;
  static double smallPadSize = 768;
  static double padSize = 1024;
  static double phoneRate = 1;
  static double smallPadRate = 1.2;
  static double padRate = 1.5;

  static double responsiveSize(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= smallPadSize)
      return size * phoneRate;
    else if (screenWidth <= padRate)
      return size * smallPadRate;
    else
      return size * padRate;
  }

  static String dateFormat(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static PlatformAlertDialog showAlertDialog(
      BuildContext context, String content) {
    showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              title: Text("Error").tr(),
              content: Text(content).tr(),
              actions: <Widget>[
                PlatformDialogAction(
                  child: PlatformText('Dismiss'.tr()),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
  }

  static PlatformAlertDialog showConfirmDialog(BuildContext context,
      {String title, String content, VoidCallback onPress}) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: Text(title).tr(),
        content: Text(content).tr(),
        actions: <Widget>[
          PlatformDialogAction(
            material: (_, __) => MaterialDialogActionData(),
            cupertino: (_, __) => CupertinoDialogActionData(),
            child: PlatformText('Cancel'.tr()),
            onPressed: () => Navigator.pop(context),
          ),
          PlatformDialogAction(
            child: PlatformText('Confirm'.tr()),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }

  static Future<File> createFileFromString(String encodedStr, String ext) async {
    try{
      Uint8List bytes = base64.decode(encodedStr);
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + "." + ext);
      return await file.writeAsBytes(bytes);
    }catch(e){
      print(e);
    }
  }

  static String generateRandomString(int numCharacter) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        numCharacter, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
