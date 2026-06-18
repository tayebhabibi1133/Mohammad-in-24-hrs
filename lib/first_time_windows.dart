import 'package:flutter/material.dart';
import 'package:mohammad_in_24hrs/l10n/app_localizations.dart';
import 'package:mohammad_in_24hrs/main.dart';
import 'package:mohammad_in_24hrs/services/notification_services.dart';
import 'package:mohammad_in_24hrs/services/permission_services.dart';
import 'package:mohammad_in_24hrs/services/storage_service.dart';

class FirstWindow extends StatefulWidget {
  const FirstWindow({
    super.key,
    required this.changeTheme,
    required this.changeTheLang,
  });
  final void Function(String) changeTheLang;
  final void Function(bool) changeTheme;

  @override
  State<FirstWindow> createState() => _FirstWindowState();
}

class _FirstWindowState extends State<FirstWindow> {
  String userName = '';

  Future<void> _checkFirstSeen() async {
    // Correctly call the static method from your storage_service.dart
    bool seen = SharedPreferencesHelper.hasSeenPermissionDialog();

    if (!seen) {
      // Small delay ensures the UI is painted before the dialog pops up
      Future.delayed(Duration.zero, () => _showPermissionDialog());
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.notifications_active, color: greenColor),
              SizedBox(width: 10),
              Text("Enable Reminders"),
            ],
          ),
          content: const Text(
            "To ensure your Sunnah reminders arrive exactly on time, "
            "please allow 'Alarms & Reminders' in the next screen.",
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: greenColor),
              child: const Text(
                "ENABLE NOW",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                // 1. Mark as "Seen" in our storage service helper

                Navigator.of(context).pop();
                await SharedPreferencesHelper.setSeenPermissionDialog(true);

                // 2. Close the popup

                // 3. Open system settings directly
                await PermissionService.requestNotificationPermissions();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    String? language = SharedPreferencesHelper.getLocal() ?? 'true';
    final deviceWidt = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    return SizedBox(
      height: deviceHeight * 1,
      child: Scaffold(
        backgroundColor: primaryWhite,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Image.asset(
                  'assets/images/language.webp',
                  cacheWidth: 1000,
                  width: 0.9 * deviceWidt,
                ),
                Text(
                  myLang.selectLangContent,
                  textAlign: .center,
                  style: TextStyle(fontSize: deviceWidt * 0.05),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: .all(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    backgroundColor: .all(greenColor),
                    foregroundColor: .all(primaryWhite),
                    textStyle: .all(TextStyle(fontSize: deviceWidt * 0.04)),
                  ),
                  onPressed: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: Text(myLang.selectLang),
                        content: SizedBox(
                          height: 600,
                          width: 70,
                          child: RadioGroup(
                            onChanged: (value) async {
                              setState(() {
                                language = value;
                              });
                              widget.changeTheLang(value!);
                              Navigator.pop(context);
                              await SharedPreferencesHelper.setLocal(value);
                              await NotificationServices().cancelallSunnah();
                            },
                            groupValue: language,
                            child: ListView(
                              children: [
                                Column(
                                  children: [
                                    RadioListTile(
                                      value: 'true',
                                      title: Text(''),
                                    ),
                                    RadioListTile(
                                      value: 'en',
                                      title: Text(myLang.englishLang),
                                    ),
                                    RadioListTile(
                                      value: 'fa',
                                      title: Text(myLang.persianLang),
                                    ),
                                    RadioListTile(
                                      value: 'ps',
                                      title: Text(myLang.pashtoLang),
                                    ),
                                    RadioListTile(
                                      value: 'ar',
                                      title: Text(myLang.arabicLang),
                                    ),
                                    RadioListTile(
                                      value: 'de',
                                      title: Text(myLang.germanLang),
                                    ),
                                    RadioListTile(
                                      value: 'es',
                                      title: Text(myLang.spanishLang),
                                    ),
                                    RadioListTile(
                                      value: 'ru',
                                      title: Text(myLang.russianLang),
                                    ),
                                    RadioListTile(
                                      value: 'zh',
                                      title: Text(myLang.chineseLang),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(myLang.selectLang),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: .all(20),
                  child: TextField(
                    maxLength: 8,
                    onChanged: (value) {
                      setState(() {
                        userName = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: myLang.enterName,
                      focusColor: greenColor,
                      focusedBorder: OutlineInputBorder(),
                      enabled: SharedPreferencesHelper.getLocal() == null
                          ? false
                          : true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: userName == ''
                      ? null
                      : () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondWindow(
                                changeTheLang: widget.changeTheLang,
                                changeTheme: widget.changeTheme,
                              ),
                            ),
                          );
                          await SharedPreferencesHelper.setUserName(userName);
                          await NotificationServices.initNotifacation();
                          await NotificationServices().cancelallSunnah();
                          await NotificationServices.hardCodedForMorning(7, 30);
                          await NotificationServices.hardCodedForNoon(11, 30);
                          await NotificationServices.hardCodedForEvening(
                            21,
                            30,
                          );
                          await NotificationServices().hardCodedforAzkar(
                            7000,
                            6,
                            30,
                          );
                          await NotificationServices().hardCodedforAzkar(
                            7001,
                            16,
                            00,
                          );
                          await NotificationServices().hardCodedforAzkar(
                            7002,
                            21,
                            00,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    padding: .symmetric(horizontal: 80, vertical: 20),
                    backgroundColor: greenColor,
                  ),
                  child: Text(
                    myLang.next,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondWindow extends StatelessWidget {
  const SecondWindow({
    super.key,
    required this.changeTheme,
    required this.changeTheLang,
  });
  final void Function(String) changeTheLang;
  final void Function(bool) changeTheme;

  @override
  Widget build(BuildContext context) {
    final deviceWidt = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: secondryWhite,
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight * 1.1,
          child: Center(
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Image.asset(
                  'assets/images/did_you_know.webp',
                  width: 0.9 * deviceWidt,
                  cacheWidth: 800,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Text(
                    myLang.aboutMohammad,
                    textAlign: .center,
                    style: TextStyle(fontSize: deviceWidt * 0.04),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: .all(
                      EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    ),
                    backgroundColor: .all(greenColor),
                    foregroundColor: .all(primaryWhite),
                    textStyle: .all(TextStyle(fontSize: deviceWidt * 0.04)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdWindow(
                          changeTheLang: changeTheLang,
                          changeTheme: changeTheme,
                        ),
                      ),
                    );
                  },
                  child: Text(myLang.next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdWindow extends StatelessWidget {
  const ThirdWindow({
    super.key,
    required this.changeTheme,
    required this.changeTheLang,
  });
  final void Function(String) changeTheLang;
  final void Function(bool) changeTheme;

  @override
  Widget build(BuildContext context) {
    final deviceWidt = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    return SizedBox(
      height: deviceHeight * 1,
      child: Scaffold(
        backgroundColor: secondryWhite,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Image.asset(
                  'assets/images/thinking_boy.webp',
                  width: 0.9 * deviceWidt,
                  cacheWidth: 800,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Text(
                    myLang.howCanI,
                    textAlign: .center,
                    style: TextStyle(fontSize: deviceWidt * 0.045),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: .all(
                      EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    ),
                    backgroundColor: .all(greenColor),
                    foregroundColor: .all(primaryWhite),
                    textStyle: .all(TextStyle(fontSize: deviceWidt * 0.04)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForthWindow(
                          changeTheLang: changeTheLang,
                          changeTheme: changeTheme,
                        ),
                      ),
                    );
                  },
                  child: Text(myLang.next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForthWindow extends StatelessWidget {
  const ForthWindow({
    super.key,
    required this.changeTheme,
    required this.changeTheLang,
  });
  final void Function(String) changeTheLang;
  final void Function(bool) changeTheme;

  @override
  Widget build(BuildContext context) {
    final deviceWidt = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: secondryWhite,
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight * 1,
          child: Center(
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Image.asset('assets/images/group.png', width: 0.9 * deviceWidt),
                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Text(
                    myLang.expectations,
                    textAlign: .center,
                    style: TextStyle(fontSize: deviceWidt * 0.04),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: .all(
                      EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    ),
                    backgroundColor: .all(greenColor),
                    foregroundColor: .all(primaryWhite),
                    textStyle: .all(TextStyle(fontSize: deviceWidt * 0.04)),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainApp(
                          changeTheLang: changeTheLang,
                          changeTheme: changeTheme,
                        ),
                      ),
                    );
                    await SharedPreferencesHelper.setBoolForFirst(true);
                  },
                  child: Text(myLang.ready),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
