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
  List<Color> neonButton = <Color>[
    const Color(0xFFF6F0FF),
    const Color(0xFFED4A3C)
  ];
  Color neonBorder = const Color(0xFF1C0C4E);
  List<Color> neonGradient = <Color>[
    const Color(0xFFCCFF8C),
    const Color(0xFF81DE76),
    const Color(0xFFFFA351)
  ];

  themeA() {
    setState(() {
      neonButton = <Color>[const Color(0xFF7100FD), const Color(0xFFA88181)];
      neonBorder = const Color(0xFFDCAB45);
      neonGradient = <Color>[
        const Color(0xFFFF0000),
        const Color(0xFFD93D3D),
        const Color(0xFFA35555)
      ];
    });
  }

  themeB() {
    setState(() {
      neonButton = <Color>[const Color(0xFF9B63F6), const Color(0xFF4405AA)];
      neonBorder = const Color(0xFF676286);
      neonGradient = <Color>[
        const Color(0xFF263D10),
        const Color(0xFF318224),
        const Color(0xFFFFBC80)
      ];
    });
  }

  themeC() {
    setState(() {
      neonButton = <Color>[const Color(0xFFF6F0FF), const Color(0xFFED4A3C)];
      neonBorder = const Color(0xFF1C0C4E);
      neonGradient = <Color>[
        const Color(0xFFCCFF8C),
        const Color(0xFF81DE76),
        const Color(0xFFFFA351)
      ];
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
      neonBorder: neonBorder,
    );
  }
}

class Updating extends InheritedWidget {
  final int counter;
  final _StateWidgetState stateWidget;
  final Color neonBorder;

  const Updating({
    Key? key,
    required Widget child,
    required this.counter,
    required this.stateWidget,
    required this.neonBorder,
  }) : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) {
    final _StateWidgetState? result =
        context.dependOnInheritedWidgetOfExactType<Updating>()!.stateWidget;
    assert(result != null, 'No Updating found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Updating oldWidget) {
    return oldWidget.counter != counter || oldWidget.neonBorder != neonBorder;
  }
}
