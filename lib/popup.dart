import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class WinnerAlert extends StatelessWidget {
  const WinnerAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('CONGRATULATIONS!', textAlign: TextAlign.center,),
      content: Text('The match is won by player $result by $total taps'),
      actions: [
        Center(
          child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK',)),
        )
      ],
    );
  }
}
