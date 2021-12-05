//update tap n taps
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;
import 'main.dart';

class WinnerAlert extends StatelessWidget {
  const WinnerAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      //for IOS devices only, because if used on Android will cause bug where ok button can't be used
      return CupertinoAlertDialog(
        title: const Text(
          'CONGRATULATIONS!',
          textAlign: TextAlign.center,
        ),
        content: Text('The match is $result by $total taps.'),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                total = 0;
              },
              child: const Text('OK'),
            ),
          )
        ],
      );
    } else {
      return AlertDialog(
        title: const Text(
          'CONGRATULATIONS!',
          textAlign: TextAlign.center,
        ),
        content: Text('The match is $result with $total taps.',
            textAlign: TextAlign.center),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                total = 0;
              },
              child: const Text('OK'),
            ),
          )
        ],
      );
    }
  }
}
