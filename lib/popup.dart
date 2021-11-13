import 'package:flutter/material.dart';

class WinnerAlert extends StatelessWidget {
  const WinnerAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 28,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      title: const Text('CONGRATULATIONS!', textAlign: TextAlign.center,),
      content: const Text('Player has won the match with points'),
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
