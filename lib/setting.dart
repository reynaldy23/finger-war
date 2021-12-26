import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';
import 'main.dart';

import 'inherited.dart';

List<String> languages = <String>[
  'English',
  'Bahasa Indonesia',
  'Bahasa Melayu',
  '日本語',
  'Chinese (Simplified)',
  'हिन्दी',
  '한국어',
  'Русский язык',
  'Português'
];

String defaultLanguage = 'English';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
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
                        minWidth: 83,
                        initialLabelIndex: switch1,
                        totalSwitches: 3,
                        labels: [
                          'setting_ocean'.tr,
                          'setting_nature'.tr,
                          'setting_snow'.tr
                        ], //index 0,1,2
                        onToggle: (index) {
                          setState(() {
                            switch1 = index;
                          });
                          if (index == 0) {
                            Updating.of(context).themeOcean();
                          } else if (index == 1) {
                            Updating.of(context).themeNature();
                          } else if (index == 2) {
                            Updating.of(context).themeSnow();
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
                        minWidth: 68,
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
                        },
                      ),
                    ],
                  ),
                  Container(height: 15),
                  Row(
                    children: <Widget>[
                      Text(
                        'setting_language'.tr,
                        style: const TextStyle(fontSize: 20),
                      ),
                      DropdownButton(
                        dropdownColor: Colors.blue,
                        icon: const Icon(Icons.language),
                        value: defaultLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            defaultLanguage = newValue.toString();
                          });
                        },
                        items: languages.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            onTap: () {
                              if (valueItem == 'English') {
                                Get.updateLocale(const Locale('en', 'US'));
                                //snackBar = SnackBar(content: Text('English'));
                              } else if (valueItem == 'Bahasa Indonesia') {
                                Get.updateLocale(const Locale('id', 'ID'));
                              } else if (valueItem == 'Bahasa Melayu') {
                                Get.updateLocale(const Locale('ms', 'MY'));
                              } else if (valueItem == '日本語') {
                                Get.updateLocale(const Locale('ja', 'JP'));
                              } else if (valueItem == 'Chinese (Simplified)') {
                                Get.updateLocale(const Locale('zh', 'CN'));
                              } else if (valueItem == 'हिन्दी') {
                                Get.updateLocale(const Locale('hi', 'IN'));
                              } else if (valueItem == '한국어') {
                                Get.updateLocale(const Locale('ko', 'KR'));
                              } else if (valueItem == 'Русский язык') {
                                Get.updateLocale(const Locale('ru', 'RU'));
                              } else if (valueItem == 'Português') {
                                Get.updateLocale(const Locale('pt', 'PT'));
                              }
                            },
                            child: Text(valueItem),
                          );
                        }).toList(),
                      )
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
