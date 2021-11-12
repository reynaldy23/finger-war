import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

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
  String start = 'START';
  String stop = 'STOP';
  int countdown = 60;
  bool isStop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
                angle: pi,
                child: Text(
                  countdown.toString(),
                  style: const TextStyle(fontSize: 43),
                )),
            const SizedBox(
              height: 20,
            ),
            Stack(
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
                              if (isStop) timer.cancel();
                              setState(() {
                                countdown--;
                                start = 'STOP';
                              });
                            });

                        },
                        child: Text(start),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              countdown.toString(),
              style: const TextStyle(fontSize: 43),
            ),
          ],
        ),
      ),
    );
  }
}
