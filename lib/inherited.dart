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
  Color bgColor = const Color(0xFFC0C5D2);

  themeOcean() {
    setState(() {
      button = <Color>[const Color(0xFF609196), const Color(0xFF82B5CA)];
      border = const Color(0xFF609196);
      startButton = const Color(0xFF7DDEF0);
      timeColor = const Color(0xFF666462);
      bgColor = const Color(0xFFC0C5D2);
    });
  }

  themeNature() {
    setState(() {
      button = <Color>[const Color(0xFFA4BB35), const Color(0xFF294324)];
      border = const Color(0xFF8C9639);
      startButton = const Color(0xFF7DDEF0);
      timeColor = const Color(0xFFF9FFD8);
      bgColor = const Color(0xFF8C9639);
    });
  }

  themeSnow() {
    setState(() {
      button = <Color>[const Color(0xFFD4D7E3), const Color(0xFFE8EFFF)];
      border = const Color(0xFFABAFBB);
      startButton = const Color(0xFF8E9099);
      timeColor = const Color(0xFFF9FFD8);
      bgColor = const Color(0xFFC0C5D2);
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
