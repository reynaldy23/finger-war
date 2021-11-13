import 'dart:async';

import 'package:finger_war/popup.dart';
import 'package:flutter/material.dart';
import 'dart:math';

int countdown = 10;
bool isStop = true;
int player1 = 0;
int player2 = 0;
int point1 = 0;
int point2 = 0;
int total = 0;
String one = 'Player 1';
String two = 'Player 2';
String start = 'START';
String result = '';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        player1++;
                        point1 = player1;
                      });
                    },
                    child: Transform.rotate(angle: pi, child: Text(one)),
                    style: TextButton.styleFrom(),
                  )),
            ),
            Expanded(
              flex: 0.5.toInt(),
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
                          onPressed: () {
                            isStop = false;
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
                              start = 'STOP';
                              one = 'KEEP PRESSING';
                              two = one;
                            });
                          },
                          child: Text(start),
                        ),
                      ],
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
              flex: 0.5.toInt(),
              child: Text(
                player2.toString(),
                style: const TextStyle(fontSize: 43),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        player2++;
                        point2 = player2;
                      });
                    },
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
      winner();
      isStop = true;
      player1 = 0;
      player2 = 0;
      countdown = 10;
      one = 'Player 1';
      two = 'Player 2';
      start = 'START';
      popUp(context);
    }
  }
}

void winner(){
  if (point1 == point2){
    result = 'tie';
  } else if (point1 > point2){
    result = '1';
    total = point1;
  } else {
    result = '2';
    total = point2;
  }
}