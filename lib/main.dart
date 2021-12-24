import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart'; //much better font usage compared to manually import in pubspec

import 'package:finger_war/popup.dart';
import 'package:finger_war/setting.dart';
import 'package:finger_war/inherited.dart';
import 'package:finger_war/Languages.dart';

import 'dart:async';
import 'dart:math';

bool themeMode = false;
int player1 = 0; //score
int player2 = 0;
int switch1 = 0;
int switch2 = 0;
int point1 = 0; //backup score
int point2 = 0;
int total = 0; //total score at pop up
String one = 'main_player1'.tr;
String two = 'main_player2'.tr;
String result = '';

List<String> timeSelection = <String>[
  '15',
  '30',
  '45',
  '60',
];
String defaultTime = '15'; // default time when opening the app

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: GetMaterialApp(
        translations: Languages(), //languages page
        locale: Get.deviceLocale, //default device's language
        fallbackLocale: const Locale('en',
            'US'), //backup if default language is not detected / compatible
        theme: ThemeData(fontFamily: GoogleFonts.getFont('Inter').fontFamily),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool buttonStatus = true;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final counter = Updating.of(context).counter;
    final neonBorder = Updating.of(context).neonBorder;
    final neonButton = Updating.of(context).neonButton;
    final neonGradient = Updating.of(context).neonGradient;

    bool isStop = true;
    int countdown = counter;

    void timeOver() {
      Updating.of(context).timeCount();
      countdown--;
      if (countdown == 0) {
        Updating.of(context).resetCount();
        buttonStatus = true;
        winner();
        isStop = true;
        point1 = 0;
        point2 = 0;
        player1 = 0;
        player2 = 0;
        one = 'main_player1'.tr;
        two = 'main_player2'.tr;
        popUp(context);
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFDE7D9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0, 0),
                        radius: 0.28,
                        colors: <Color>[neonButton[0], neonButton[1]],
                        stops: const <double>[0.9, 1.0],
                      ),
                      border: Border.all(width: 3, color: neonBorder),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextButton(
                      onPressed: buttonStatus == false
                          ? () {
                              setState(() {
                                player2++;
                                point2 = player2;
                              });
                            }
                          : null,
                      child: Transform.rotate(angle: pi, child: Text(two)),
                      style: TextButton.styleFrom(),
                    ),
                  )),
            ),
            Transform.rotate(
                angle: pi,
                child: Text(
                  '$player2', //alt -> player1.toString()
                  style: const TextStyle(fontSize: 43),
                )),
            Expanded(
              flex: 1,
              child: Transform.rotate(
                  angle: pi,
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 43,
                            color: Colors.black,
                            fontFamily:
                                GoogleFonts.getFont('Inter').fontFamily),
                        children: [
                          TextSpan(text: 'time'.tr),
                          TextSpan(text: '$counter')
                        ]),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  const Divider(
                    thickness: 5,
                    color: Colors.black,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  neonGradient[0],
                                  neonGradient[1],
                                  neonGradient[2],
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(left: 60, right: 60),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: buttonStatus
                              ? () {
                                  Timer.periodic(const Duration(seconds: 1),
                                      (timer) {
                                    if (isStop) {
                                      timer.cancel();
                                    } else {
                                      timeOver();
                                    }
                                  });
                                  setState(() {
                                    isStop = false;
                                    buttonStatus = false;
                                    one = 'main_keepPressing'.tr;
                                    two = one;
                                  });
                                }
                              : null,
                          child: Text('main_start'.tr),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 35,
                    child: IconButton(
                      onPressed: buttonStatus
                          ? () {
                              settingPage(context);
                            }
                          : null,
                      icon: const Icon(
                        Icons.settings,
                        size: 43,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                overflow: TextOverflow.visible,
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 43,
                        color: Colors.black,
                        fontFamily: GoogleFonts.getFont('Inter').fontFamily),
                    children: [
                      TextSpan(text: 'time'.tr),
                      TextSpan(text: '$counter')
                    ]),
              ),
            ),
            Text(
              '$player1',
              style: const TextStyle(fontSize: 43),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0, 0),
                        radius: 0.28,
                        colors: <Color>[neonButton[0], neonButton[1]],
                        stops: const <double>[0.9, 1.0],
                      ),
                      border: Border.all(width: 3, color: neonBorder),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: TextButton(
                      onPressed: buttonStatus ==
                              false //if buttonStatus false go state else null
                          ? () {
                              setState(() {
                                player1++;
                                point1 = player1;
                              });
                            }
                          : null,
                      child: Text(one),
                      style: TextButton.styleFrom(),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void popUp(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //to make user quit only via button
      builder: (BuildContext context) {
        return const WinnerAlert();
      },
    );
  }
}

void winner() {
  if (point1 == point2) {
    result = 'main_draw'.tr;
    total = point1;
  } else if (point1 > point2) {
    result = 'main_player1win'.tr;
    total = point1;
  } else {
    result = 'main_player2win'.tr;
    total = point2;
  }
}

void settingPage(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const Settings();
    },
  );
}
