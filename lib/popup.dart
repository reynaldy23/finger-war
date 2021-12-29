//update tap n taps
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

import 'main.dart';

class WinnerAlert extends StatelessWidget {
  const WinnerAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      //for IOS devices only, because if used on Android will cause bug where ok button can't be used
      return CupertinoAlertDialog(
        title: Text(
          'popup_congratulation'.tr,
          textAlign: TextAlign.center,
        ),
        content: RichText(
            text: TextSpan(children: [
          TextSpan(text: 'popup_1'.tr),
          TextSpan(text: '$result '),
          TextSpan(text: 'popup_2'.tr),
          TextSpan(text: '$total '),
          TextSpan(text: 'popup_3'.tr)
        ])),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                total = 0;
              },
              child: Text('popup_ok'.tr),
            ),
          )
        ],
      );
    } else {
      return AlertDialog(
        title: Text(
          'popup_congratulation'.tr,
          textAlign: TextAlign.center,
        ),
        content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'popup_1'.tr),
                  TextSpan(text: '$result '),
                  TextSpan(text: 'popup_2'.tr),
                  TextSpan(text: '$total '),
                  TextSpan(text: 'popup_3'.tr)
                ])),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                total = 0;
              },
              child: Text('popup_ok'.tr),
            ),
          )
        ],
      );
    }
  }
}
