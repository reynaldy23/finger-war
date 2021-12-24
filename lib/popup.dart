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
          TextSpan(text: 'The match is '.tr),
          TextSpan(text: '$result '),
          TextSpan(text: 'by'.tr),
          TextSpan(text: '$total '),
          TextSpan(text: 'taps.'.tr)
        ])),
        // RichText(
        //   overflow: TextOverflow.visible,
        //   text: TextSpan(
        //       style: TextStyle(
        //           fontSize: 43,
        //           color: Colors.black,
        //           fontFamily:
        //           GoogleFonts.getFont('Pacifico').fontFamily),
        //       children: [
        //         TextSpan(text: 'time'.tr),
        //         TextSpan(text: '$counter')
        //       ]),
        // )
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
            text: TextSpan(style: const TextStyle(color: Colors.black) ,
                children: [
              TextSpan(text: 'The match is '.tr),
              TextSpan(text: '$result '),
              TextSpan(text: 'by '.tr),
              TextSpan(text: '$total '),
              TextSpan(text: 'taps.'.tr)
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
