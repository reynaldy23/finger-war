import 'package:finger_war/popup.dart';
import 'package:finger_war/setting.dart';
import 'package:finger_war/inherited.dart';
import 'package:finger_war/Languages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; //much better font usage compared to manually import in pubspec
// import 'package:google_mobile_ads/google_mobile_ads.dart';

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
String result = '';

List<String> timeSelection = <String>[
  '15',
  '30',
  '45',
  '60',
];
String defaultTime = '15'; // default time when opening the app

double playerFont = 23;
double scoreFont = 30;
double timeFont = 33;

main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
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
        theme:
            ThemeData(fontFamily: GoogleFonts.getFont('Montserrat').fontFamily),
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

  @override
  Widget build(BuildContext context) {
    final counter = Updating.of(context).counter;
    final border = Updating.of(context).border;
    final button = Updating.of(context).button;
    final startButton = Updating.of(context).startButton;
    final timeColor = Updating.of(context).timeColor;
    final bgColor = Updating.of(context).bgColor;

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
        popUp(context);
      }
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 0.28,
                        colors: <Color>[button[0], button[1]],
                        stops: const <double>[1.0, 1.0],
                      ),
                      border: Border.all(width: 3, color: border),
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
                      child: Transform.rotate(
                          angle: pi,
                          child: Text('main_player2'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: playerFont,
                                  fontWeight: FontWeight.bold))),
                    ),
                  )),
            ), //player 2 button
            Transform.rotate(
                angle: pi, //180'
                child: Text(
                  '$player2', //alt -> player1.toString()
                  style: TextStyle(fontSize: scoreFont, color: timeColor),
                )), //player 2 score
            Expanded(
              flex: 1,
              child: Transform.rotate(
                  angle: pi,
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: timeFont,
                            color: timeColor,
                            fontFamily:
                                GoogleFonts.getFont('Montserrat').fontFamily),
                        children: [
                          TextSpan(text: 'time'.tr),
                          TextSpan(text: '$counter')
                        ]),
                  )),
            ), //player 2 time
            Expanded(
              flex: 1,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: FractionalOffset.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: startButton,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(left: 43, right: 43),
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
                                  });
                                }
                              : null,
                          child: Text(
                            'main_start'.tr,
                            style: const TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: buttonStatus
                          ? () {
                              settingPage(context);
                            }
                          : null,
                      icon: const Icon(
                        Icons.settings,
                        size: 33,
                      ),
                    ),
                  ),
                ],
              ),
            ), //start button & setting
            Expanded(
              flex: 1,
              child: RichText(
                overflow: TextOverflow.visible,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: timeFont,
                      color: timeColor,
                      fontFamily: GoogleFonts.getFont('Montserrat').fontFamily,
                    ),
                    children: [
                      TextSpan(text: 'time'.tr),
                      TextSpan(text: '$counter')
                    ]),
              ),
            ), //player 1 time
            Text(
              '$player1',
              style: TextStyle(fontSize: scoreFont, color: timeColor),
            ), //player 1 score
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0, 0),
                        radius: 0.28,
                        colors: <Color>[button[0], button[1]],
                        stops: const <double>[1.0, 1.0],
                      ),
                      border: Border.all(width: 3, color: border),
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
                      child: Text(
                        'main_player1'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: playerFont,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ) //player 1 button
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
