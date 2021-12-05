import 'package:flutter/material.dart';

class Updating extends InheritedWidget {
  final int counter;

  const Updating({
    Key? key,
    required Widget child,
    required this.counter,
  }) : super(key: key, child: child);

  static Updating of(BuildContext context) {
    final Updating? result = context.dependOnInheritedWidgetOfExactType<Updating>() as Updating;
    assert(result != null, 'No Updating found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Updating oldWidget) {
    return oldWidget.counter != counter;
  }
}