import 'package:flutter/material.dart';
import 'package:finger_war/popup.dart';
import 'package:finger_war/setting.dart';

import 'dart:async';
import 'dart:math';

bool isStop = true;
bool themeMode = false;
int countdown = 15;
int defaultCounter = 15;
int player1 = 0;
int player2 = 0;
int point1 = 0;
int point2 = 0;
int total = 0;
String one = 'Player 1';
String two = 'Player 2';
String result = '';


List<String> timeSelection = <String>[
  '15',
  '30',
  '45',
  '60',
];
String defaultTime = '15';

typeTime(){
  timeSelection.map((valueItem) {
    return DropdownMenuItem(
      value: valueItem,
      child: Text(valueItem),
      onTap: (){},
    );
  }).toList();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool status = true;

  disableButton(){
    setState(() {
      status = false;
    });
  }

  enableButton(){
    setState(() {
      status = true;
    });
  }

  buttonTest(){
    SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
          total = 0;
        },
        child: const Text('OK'),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: status == false ? () {
                      setState(() {
                        player1++;
                        point1 = player1;
                      });
                    } : null,
                    child: Transform.rotate(angle: pi, child: Text(one)),
                    style: TextButton.styleFrom(),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Transform.rotate(
                  angle: pi,
                  child: Text(
                    player1.toString(),
                    style: const TextStyle(fontSize: 43),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Transform.rotate(
                  angle: pi,
                  child: Text(
                    'Time: $countdown',
                    style: const TextStyle(fontSize: 43),
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
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 80, right: 80),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: status ? () {
                            isStop = false;
                            disableButton();
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                              setState(() {
                                if (isStop) {
                                  timer.cancel();
                                } else {
                                  timeOver();
                                }
                              });
                            });
                            setState(() {
                              //setState separated because to reduce hardware strain (very minor)
                              one = 'KEEP PRESSING';
                              two = one;
                            });
                          } : null,
                          child: const Text('START'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 35,
                    child: IconButton(
                      onPressed: status ? () {
                        settingPage(context);
                        setState(() {
                          player1 = 10;
                        });
                      }: null,
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
              child: Text(
                'Time: $countdown',
                style: const TextStyle(fontSize: 43),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                player2.toString(),
                style: const TextStyle(fontSize: 43),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: status == false ? () {//if status false go state else null
                      setState(() {
                        player2++;
                        point2 = player2;
                      });
                    } : null,
                    child: Text(two),
                    style: TextButton.styleFrom(),
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

  void timeOver() {
    countdown--;
    if (countdown == -1) {
      enableButton();
      winner();
      isStop = true;
      point1 = 0;
      point2 = 0;
      player1 = 0;
      player2 = 0;
      countdown = defaultCounter;
      one = 'Player 1';
      two = 'Player 2';
      popUp(context);
    }
  }
}

void winner() {
  if (point1 == point2) {
    result = 'tie';
    total = point1;
  } else if (point1 > point2) {
    result = 'won by player 1';
    total = point1;
  } else {
    result = 'won by player 2';
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

