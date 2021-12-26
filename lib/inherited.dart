import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  final Widget child;
  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  int counter = 15;
  int defaultCounter = 15;
  
  List<Color> button = <Color>[
    const Color(0xFF609196),
    const Color(0xFF82B5CA)
  ];
  Color border = const Color(0xFF609196);
  Color startButton = const Color(0xFF7DDEF0);
  Color timeColor = const Color(0xFF666462);

  themeA() {
    setState(() {
      button = <Color>[const Color(0xFF609196), const Color(0xFF82B5CA)];
      border = const Color(0xFF609196);
      startButton = const Color(0xFF7DDEF0);
      timeColor = const Color(0xFF666462);
    });
  }

  themeB() {
    setState(() {
      button = <Color>[const Color(0xFF9B63F6), const Color(0xFF4405AA)];
      border = const Color(0xFF676286);
      startButton = const Color(0xFF7DDEF0);
      timeColor = const Color(0xFF666462);
    });
  }

  themeC() {
    setState(() {
      button = <Color>[const Color(0xFF7100FD), const Color(0xFFA88181)];
      border = const Color(0xFFDCAB45);
      startButton = const Color(0xFF7DDEF0);
      timeColor = const Color(0xFF666462);
    });
  }

  time15() {
    setState(() {
      counter = 15;
      defaultCounter = 15;
    });
  }

  time30() {
    setState(() {
      counter = 30;
      defaultCounter = 30;
    });
  }

  time45() {
    setState(() {
      counter = 45;
      defaultCounter = 45;
    });
  }

  time60() {
    setState(() {
      counter = 60;
      defaultCounter = 60;
    });
  }

  timeCount() {
    setState(() {
      counter--;
    });
  }

  resetCount() {
    setState(() {
      counter = defaultCounter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Updating(
      child: widget.child,
      counter: counter,
      stateWidget: this,
      border: border,
    );
  }
}

class Updating extends InheritedWidget {
  final int counter;
  final _StateWidgetState stateWidget;
  final Color border;

  const Updating({
    Key? key,
    required Widget child,
    required this.counter,
    required this.stateWidget,
    required this.border,
  }) : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) {
    final _StateWidgetState? result =
        context.dependOnInheritedWidgetOfExactType<Updating>()!.stateWidget;
    assert(result != null, 'No Updating found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Updating oldWidget) {
    return oldWidget.counter != counter || oldWidget.border != border;
  }
}
