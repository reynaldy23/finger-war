import 'package:flutter/material.dart';
import 'inherited.dart';
import 'main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void first(){
    final provider1 = Updating.of(context);
    provider1.type1();
  }

  void second(){
    final provider2 = Updating.of(context);
    provider2.type2();
  }

  void third(){
    final provider3 = Updating.of(context);
    provider3.type3();
  }

  void fourth(){
    final provider4 = Updating.of(context);
    provider4.type4();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Theme:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: Switch(
                            value: themeMode,
                            onChanged: (value) {
                              setState(() {
                                themeMode = value;
                              });
                            }),
                      )
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Time:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: DropdownButton(
                          value: defaultTime,
                          onChanged: (newValue) {
                            setState(() {
                              defaultTime = newValue.toString();}
                            );
                            if (newValue == '15'){
                              first();
                            }
                            else if (newValue == '30') {
                              second();
                            }
                            else if (newValue == '45') {
                              third();
                            }
                            else if (newValue == '60') {
                              fourth();
                            }
                          },
                          items: timeSelection.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                              onTap: () {
                                timeSelection.map(
                                      (valueItem) {
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem)
                                    );
                                  },
                                );
                              },
                            );
                          }).toList(),
                        ),
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
