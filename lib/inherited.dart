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

  type1(){
    setState(() {
      counter = 15;
      defaultCounter = 15;
    });
  }

  type2(){
    setState(() {
      counter = 30;
      defaultCounter = 30;
    });
  }

  type3(){
    setState(() {
      counter = 45;
      defaultCounter = 45;
    });
  }

  type4(){
    setState(() {
      counter = 60;
      defaultCounter = 60;
    });
  }

  timeCount(){
    setState(() {
      counter--;
    });
  }

  resetCount(){
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
    );
  }
}


class Updating extends InheritedWidget {
  final int counter;
  final _StateWidgetState stateWidget;

  const Updating({
    Key? key,
    required Widget child,
    required this.counter,
    required this.stateWidget,
  }) : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) {
    final _StateWidgetState? result = context.dependOnInheritedWidgetOfExactType<Updating>()!.stateWidget;
    assert(result != null, 'No Updating found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Updating oldWidget) {
    return oldWidget.counter != counter;
  }
}