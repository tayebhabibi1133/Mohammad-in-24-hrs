import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohammad_in_24hrs/l10n/app_localizations.dart';
import 'package:mohammad_in_24hrs/main.dart';
import 'package:mohammad_in_24hrs/services/notification_services.dart';
import 'package:mohammad_in_24hrs/services/storage_service.dart';

class More extends StatefulWidget {

  const More({
    super.key,
    required this.changeTheLang,
    required this.changeTheme,
  });

  final void Function(String) changeTheLang;
  final void Function(bool) changeTheme;
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    bool isDark = SharedPreferencesHelper.getDarkMode() ?? false;
    final fontColor = Colors.black;
    final myLang = AppLocalizations.of(context)!;
    final deviceHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: .new(.infinity, deviceHieght * 0.2),
        child: Image.asset('assets/images/4350478_18126.webp', cacheWidth: 800),
      ),
      body: Padding(
        padding: .symmetric(vertical: 30, horizontal: 0),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            SizedBox(
              height: deviceHieght * 0.5,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      color: goldenColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        widget.changeTheme(isDark ? false : true);
                        setState(() {
                          isDark = isDark ? false : true;
                        });
                      },
                      leading: Text(
                        myLang.changeTheme,
                        style: TextStyle(fontSize: 15, color: fontColor),
                      ),
                      trailing: CupertinoSwitch(
                        value: isDark,
                        onChanged: (value) {
                          widget.changeTheme(value);
                          setState(() {
                            isDark = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      color: goldenColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Text(
                        myLang.changeLang,
                        style: TextStyle(fontSize: 15, color: fontColor),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguagesPage(
                              changeLocale: widget.changeTheLang,
                            ),
                          ),
                        );
                      },
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: fontColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: .circular(20),
                  //     color: goldenColor,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Color.fromRGBO(0, 0, 0, 0.25),
                  //         spreadRadius: 2,
                  //         blurRadius: 5,
                  //       ),
                  //     ],
                  //   ),
                  //   child: ListTile(
                  //     leading: Text(
                  //       myLang.credits,
                  //       style: TextStyle(fontSize: 15, color: fontColor),
                  //     ),
                  //     onTap: () {},
                  //     trailing: Icon(
                  //       Icons.navigate_next_rounded,
                  //       color: fontColor,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      color: goldenColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Text(
                        myLang.clearHistory,
                        style: TextStyle(fontSize: 15, color: fontColor),
                      ),
                      onTap: () async{
                        await SharedPreferencesHelper.deleteHeatmapData();
                        setState(() {
                          
                        });
                      },
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: fontColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key, required this.changeLocale});

  final void Function(String) changeLocale;

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  String? language = SharedPreferencesHelper.getLocal();
  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        foregroundColor: primaryWhite,
        centerTitle: true,
        title: Text(myLang.changeLang),
      ),
      body: RadioGroup(
        onChanged: (value) async {
          setState(() {
            language = value;
          });
          widget.changeLocale(value!);
          await SharedPreferencesHelper.setLocal(value);
          await NotificationServices().cancelallSunnah();
          await NotificationServices.hardCodedForMorning(7, 30);
          await NotificationServices.hardCodedForNoon(11, 30);
          await NotificationServices.hardCodedForEvening(21, 30);
          await NotificationServices().cancelAzkar();
          await NotificationServices().hardCodedforAzkar(7000,6, 30);
          await NotificationServices().hardCodedforAzkar(7001,16, 00);
          await NotificationServices().hardCodedforAzkar(7002,21, 00);
        },
        groupValue: language,
        child: Column(
          children: [
            RadioListTile(value: 'en', title: Text(myLang.englishLang)),
            RadioListTile(value: 'fa', title: Text(myLang.persianLang)),
            RadioListTile(value: 'ps', title: Text(myLang.pashtoLang)),
            RadioListTile(value: 'ar', title: Text(myLang.arabicLang)),
            RadioListTile(value: 'de', title: Text(myLang.germanLang)),
            RadioListTile(value: 'es', title: Text(myLang.spanishLang)),
            RadioListTile(value: 'ru', title: Text(myLang.russianLang)),
            RadioListTile(value: 'zh', title: Text(myLang.chineseLang)),
          ],
        ),
      ),
    );
  }
}
