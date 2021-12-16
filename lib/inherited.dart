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

  String font = 'Pacifico';

  themeA(){
    setState(() {
      font = 'Pacifico';
    });
  }

  themeB(){
    setState(() {
      font = 'Roboto';
    });
  }

  themeC(){
    setState(() {
      font = 'Fira Sans';
    });
  }


  type1() {
    setState(() {
      counter = 15;
      defaultCounter = 15;
    });
  }

  type2() {
    setState(() {
      counter = 30;
      defaultCounter = 30;
    });
  }

  type3() {
    setState(() {
      counter = 45;
      defaultCounter = 45;
    });
  }

  type4() {
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
      font: font,
    );
  }
}

class Updating extends InheritedWidget {
  final int counter;
  final _StateWidgetState stateWidget;
  final String font;

  const Updating({
    Key? key,
    required Widget child,
    required this.counter,
    required this.stateWidget,
    required this.font,
  }) : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) {
    final _StateWidgetState? result =
        context.dependOnInheritedWidgetOfExactType<Updating>()!.stateWidget;
    assert(result != null, 'No Updating found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Updating oldWidget) {
    return oldWidget.counter != counter || oldWidget.font != font;
  }
}


// String font = 'Press Start 2P';
// List<Color> neonButton = <Color>[const Color(0xFFF6F0FF), const Color(0xFFED4A3C)];
// Color neonBorder = const Color(0xFF1C0C4E);
// List<Color> neonGradient = <Color>[
//   const Color(0xFFCCFF8C),
//   const Color(0xFF81DE76),
//   const Color(0xFFFFA351)
// ];
//
// themeA(){
//   setState(() {
//     font = 'Press Start 2P';
//     neonButton = <Color>[const Color(0xFFF6F0FF), const Color(0xFFED4A3C)];
//     neonBorder = const Color(0xFF1C0C4E);
//     neonGradient = <Color>[
//       const Color(0xFFCCFF8C),
//       const Color(0xFF81DE76),
//       const Color(0xFFFFA351)
//     ];
//   });
// }
// themeB(){
//   setState(() {
//     font = 'Odibee Sans';
//     neonButton = <Color>[const Color(0xFF9994A3), const Color(0xFF0DFF4C)];
//     neonBorder = const Color(0xFFAE9CEF);
//     neonGradient = <Color>[
//       const Color(0xFFE35A5A),
//       const Color(0xFFEC3636),
//       const Color(0xFF582B01)
//     ];
//   });
// }
// themeC(){
//   setState(() {
//     font = 'Pacifico';
//     neonButton = <Color>[const Color(0xFFF6F0FF), const Color(0xFFED4A3C)];
//     neonBorder = const Color(0xFF1C0C4E);
//     neonGradient = <Color>[
//       const Color(0xFFCCFF8C),
//       const Color(0xFF81DE76),
//       const Color(0xFFFFA351)
//     ];
//   });
// }