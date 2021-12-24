import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';
import 'main.dart';

import 'inherited.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var box = MyHomePageState().box;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 18),
      backgroundColor: Colors.lightBlueAccent,
      child: SizedBox(
        height: 250,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 2),
              child: Text(
                'setting_settings'.tr,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                      Text(
                        'setting_theme'.tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                      ToggleSwitch(
                        initialLabelIndex: switch1,
                        totalSwitches: 3,
                        labels: const ['A', 'B', 'C'], //index 0,1,2
                        onToggle: (index) {
                          box.write('indexA', index);
                          int saverA = box.read('indexA');
                          setState(() {
                            switch1 = saverA;
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
                      Text(
                        'time'.tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                      ToggleSwitch(
                          initialLabelIndex: switch2,
                          totalSwitches: 4,
                          labels: const ['15', '30', '45', '60'], //index 0,1,2
                          onToggle: (index) {
                            box.write('indexB', index);
                            int saverB = box.read('indexB');
                            setState(() {
                              switch2 = saverB;
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
                    children: <Widget>[
                      Text(
                        'setting_language'.tr,
                        style: const TextStyle(fontSize: 20),
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
