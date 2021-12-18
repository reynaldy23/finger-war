import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'inherited.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int switch1 = 0;
  int switch2 = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 18),
      backgroundColor: Colors.lightBlueAccent,
      child: SizedBox(
        height: 250,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 2),
              child: Text(
                'SETTINGS',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Container(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Theme:     ',
                        style: TextStyle(fontSize: 20),
                      ),
                      ToggleSwitch(
                        animate: true,
                        initialLabelIndex: switch1,
                        totalSwitches: 3,
                        labels: const ['A', 'B', 'C'], //index 0,1,2
                        onToggle: (index) {
                          setState(() {
                            switch1 = index;
                          });
                          if (index == 0) {
                            Updating.of(context).themeA();
                          } else if (index == 1) {
                            Updating.of(context).themeB();
                          } else if (index == 2) {
                            Updating.of(context).themeC();
                          }
                        },
                      )
                    ],
                  ),
                  Container(height: 15),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Time: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      ToggleSwitch(
                          animate: true,
                          initialLabelIndex: switch2,
                          totalSwitches: 4,
                          labels: const ['15', '30', '45', '60'], //index 0,1,2
                          onToggle: (index) {
                            setState(() {
                              switch2 = index;
                            });
                            if (index == 0) {
                              Updating.of(context).time15();
                            } else if (index == 1) {
                              Updating.of(context).time30();
                            } else if (index == 2) {
                              Updating.of(context).time45();
                            } else if (index == 3) {
                              Updating.of(context).time60();
                            }
                          }),
                      // SizedBox(
                      //   width: 60,
                      //   child: DropdownButton(
                      //     isExpanded: true,
                      //     value: defaultTime,
                      //     onChanged: (newValue) {
                      //       setState(() {
                      //         defaultTime = newValue.toString();
                      //       });
                      //       if (newValue == '15') {
                      //         Updating.of(context).time15();
                      //       } else if (newValue == '30') {
                      //         Updating.of(context).time30();
                      //       } else if (newValue == '45') {
                      //         Updating.of(context).time45();
                      //       } else if (newValue == '60') {
                      //         Updating.of(context).time60();
                      //       }
                      //     },
                      //     items: timeSelection.map((valueItem) {
                      //       return DropdownMenuItem(
                      //         value: valueItem,
                      //         child: Text(valueItem),
                      //         onTap: () {
                      //           timeSelection.map(
                      //             (valueItem) {
                      //               return DropdownMenuItem(
                      //                   value: valueItem,
                      //                   child: Text(valueItem));
                      //             },
                      //           );
                      //         },
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                    ],
                  ),
                  Container(height: 15),
                  Row(
                    children: const <Widget>[
                      Text(
                        'Language:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
