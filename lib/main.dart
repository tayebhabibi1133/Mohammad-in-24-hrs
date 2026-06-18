import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:mohammad_in_24hrs/azkar_page.dart';
import 'package:mohammad_in_24hrs/first_time_windows.dart';
import 'services/permission_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mohammad_in_24hrs/l10n/app_localizations.dart';
import 'package:mohammad_in_24hrs/library.dart';
import 'package:mohammad_in_24hrs/more.dart';
import 'package:mohammad_in_24hrs/notification.dart';
import 'package:mohammad_in_24hrs/services/notification_services.dart';
import 'package:mohammad_in_24hrs/services/storage_service.dart';


final greenColor = Color.fromRGBO(0, 118, 51, 0.77);
final goldenColor = Color.fromRGBO(246, 187, 66, 1);
var primaryWhite = Color.fromRGBO(255, 252, 222, 1);
var secondryWhite = Color.fromRGBO(255, 254, 238, 1);
final hourNow = DateTime.now().hour;
String? mainGreetingFont;
String? primaryFontFamily;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initSharedPreference();
  runApp(const MyApp());
  await NotificationServices.initNotifacation();
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static String? localeCode = SharedPreferencesHelper.getLocal();
  Locale _locale = Locale(localeCode ?? 'en');

  void changeLocale(String newLocalCode) {
    setState(() {
      _locale = Locale(newLocalCode);
    });
  }

  static bool isRegisterd = SharedPreferencesHelper.getBoolForFirst() ?? false;
  void changeTheme(bool value) async {
    setState(() {
      isDark = value;
    });
    await SharedPreferencesHelper.setDarkMode(value);
  }

  static bool isDark = SharedPreferencesHelper.getDarkMode() ?? false;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    //double deviceHeight = MediaQuery.of(context).size.height;
    primaryWhite = isDark
        ? const Color.fromARGB(221, 31, 31, 31)
        : Color.fromRGBO(255, 252, 222, 1);
    secondryWhite = isDark
        ? Color.fromARGB(221, 67, 67, 67)
        : Color.fromRGBO(255, 254, 238, 1);

    if (_locale == Locale('fa') || _locale == Locale('ar')) {
      mainGreetingFont = 'DastNavis';
      primaryFontFamily = 'Estedad';
    } else {
      mainGreetingFont = null;
      primaryFontFamily = null;
    }

    _locale == Locale('ps') ? mainGreetingFont = 'DastNavis' : null;

    return MaterialApp(
      themeMode: isDark ? .dark : .light,
      theme: ThemeData(
        iconTheme: CupertinoIconThemeData(),
        fontFamily: primaryFontFamily,
        scaffoldBackgroundColor: primaryWhite,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      darkTheme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(
          linearTrackColor: Colors.white10,
        ),
        colorScheme: .dark(),
        fontFamily: primaryFontFamily,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        pageTransitionType: .rightToLeft,
        splashIconSize: deviceWidth * 0.8,
        backgroundColor: primaryWhite,
        centered: true,
        duration: 2000,
        splash: Center(
          child: Lottie.asset('assets/splash/main_splash_final.json'),
        ),
         nextScreen: isRegisterd
             ? MainApp(changeTheLang: changeLocale, changeTheme: changeTheme)
             : FirstWindow(
                 changeTheLang: changeLocale,
                 changeTheme: changeTheme,
               ),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.changeTheLang,
    required this.changeTheme,
  });
  final void Function(String) changeTheLang;
  final void Function(bool) changeTheme;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // backgroundColor: primaryWhite,
        bottomNavigationBar: NavBar(),
        body: TabBarView(
          children: [
            Home(),
            Library(),
            NotificationMainWidget(),
            More(
              changeTheLang: widget.changeTheLang,
              changeTheme: widget.changeTheme,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static const String libraryIcon =
      '''<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<!-- Uploaded to: SVG Repo, www.svgrepo.com, Transformed by: SVG Repo Mixer Tools -->
<svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">

<g id="SVGRepo_bgCarrier" stroke-width="0"/>

<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>

<g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd" clip-rule="evenodd" d="M8.67239 7.54199H15.3276C18.7024 7.54199 20.3898 7.54199 21.3377 8.52882C22.2855 9.51565 22.0625 11.0403 21.6165 14.0895L21.1935 16.9811C20.8437 19.3723 20.6689 20.5679 19.7717 21.2839C18.8745 21.9999 17.5512 21.9999 14.9046 21.9999H9.09536C6.44881 21.9999 5.12553 21.9999 4.22834 21.2839C3.33115 20.5679 3.15626 19.3723 2.80648 16.9811L2.38351 14.0895C1.93748 11.0403 1.71447 9.51565 2.66232 8.52882C3.61017 7.54199 5.29758 7.54199 8.67239 7.54199ZM8 18.0001C8 17.5859 8.3731 17.2501 8.83333 17.2501H15.1667C15.6269 17.2501 16 17.5859 16 18.0001C16 18.4143 15.6269 18.7501 15.1667 18.7501H8.83333C8.3731 18.7501 8 18.4143 8 18.0001Z" fill="#F6BB42"/> <g opacity="0.4"> <path d="M8.51005 2.00001H15.4901C15.7226 1.99995 15.9009 1.99991 16.0567 2.01515C17.1645 2.12352 18.0712 2.78958 18.4558 3.68678H5.54443C5.92895 2.78958 6.8357 2.12352 7.94352 2.01515C8.09933 1.99991 8.27757 1.99995 8.51005 2.00001Z" fill="#F6BB42"/> </g> <g opacity="0.7"> <path d="M6.31069 4.72266C4.92007 4.72266 3.7798 5.56241 3.39927 6.67645C3.39134 6.69967 3.38374 6.72302 3.37646 6.74647C3.77461 6.6259 4.18898 6.54713 4.60845 6.49336C5.68882 6.35485 7.05416 6.35492 8.64019 6.35501L8.75863 6.35501L15.5323 6.35501C17.1183 6.35492 18.4837 6.35485 19.564 6.49336C19.9835 6.54713 20.3979 6.6259 20.796 6.74647C20.7887 6.72302 20.7811 6.69967 20.7732 6.67645C20.3927 5.56241 19.2524 4.72266 17.8618 4.72266H6.31069Z" fill="#F6BB42"/> </g> </g>

</svg>''';

  static const String selectedIcon =
      '''<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">

<!-- Uploaded to: SVG Repo, www.svgrepo.com, Transformed by: SVG Repo Mixer Tools -->
<svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">

<g id="SVGRepo_bgCarrier" stroke-width="0"/>

<g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>

<g id="SVGRepo_iconCarrier"> <path opacity="0.5" d="M22 12C22 16.714 22 19.0711 20.5355 20.5355C19.0711 22 16.714 22 12 22C7.28595 22 4.92893 22 3.46447 20.5355C2 19.0711 2 16.714 2 12C2 7.28595 2 4.92893 3.46447 3.46447C4.92893 2 7.28595 2 12 2C16.714 2 19.0711 2 20.5355 3.46447C22 4.92893 22 7.28595 22 12Z" fill="#F6BB42"/> <path d="M7 16.75C6.58579 16.75 6.25 17.0858 6.25 17.5C6.25 17.9142 6.58579 18.25 7 18.25H13C13.4142 18.25 13.75 17.9142 13.75 17.5C13.75 17.0858 13.4142 16.75 13 16.75H7Z" fill="#F6BB42"/> <path d="M7 13.25C6.58579 13.25 6.25 13.5858 6.25 14C6.25 14.4142 6.58579 14.75 7 14.75H16C16.4142 14.75 16.75 14.4142 16.75 14C16.75 13.5858 16.4142 13.25 16 13.25H7Z" fill="#F6BB42"/> <path d="M22 5C22 6.65685 20.6569 8 19 8C17.3431 8 16 6.65685 16 5C16 3.34315 17.3431 2 19 2C20.6569 2 22 3.34315 22 5Z" fill="#F6BB42"/> </g>

</svg>''';
  static dynamic onChangedValue;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    final double iconSize = (0.1 * deviceHeight).clamp(1, 29);
    return Container(
      height: (0.09 * deviceHeight).clamp(22, 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 2,
            color: const Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
        color: greenColor,
      ),
      child: TabBar(
        onTap: (value) {
          setState(() {
            onChangedValue = value;
          });
        },
        labelColor: primaryWhite,
        labelStyle: TextStyle(fontSize: (0.02 * deviceHeight).clamp(1, 20)),
        dividerColor: goldenColor,
        dividerHeight: 3,
        unselectedLabelColor: goldenColor,
        indicatorColor: primaryWhite,
        indicatorWeight: 9,
        tabs: [
          Tab(
            icon: Icon(size: iconSize, Icons.home_rounded),
            text: myLang.navBarMain,
          ),
          Tab(
            icon: Iconify(
              size: iconSize,
              libraryIcon,
              color: onChangedValue == 1 ? primaryWhite : goldenColor,
            ),
            text: myLang.navBarLibrary,
          ),
          Tab(
            icon: Iconify(
              size: iconSize,
              selectedIcon,
              color: onChangedValue == 2 ? primaryWhite : goldenColor,
            ),
            text: myLang.navBarSelected,
          ),
          Tab(
            icon: Icon(size: iconSize, Icons.more_horiz_sharp),
            text: myLang.navBarMore,
          ),
        ],
      ),
    );
  }
}




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _checkFirstSeen() async {

    bool seen = SharedPreferencesHelper.hasSeenPermissionDialog();

    if (!seen) {

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
            TextButton(
              child: Text("LATER", style: TextStyle(color: Colors.grey)),
              onPressed: () => Navigator.of(context).pop(),
            ),
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


  late Timer _timer;
  String fullTime = DateFormat.Hms().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => setState(() {
        fullTime = DateFormat.Hms().format(DateTime.now());
      }),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    var myLang = AppLocalizations.of(
      context,
    )!;


    String? greeting;
    final userName = SharedPreferencesHelper.getUseName();

    switch (hourNow) {
      case >= 4 && < 9:
        greeting = myLang.morningGreetings;
        break;
      case >= 9 && < 15:
        greeting = myLang.noonGreeting;
        break;
      case >= 15 && < 20:
        greeting = myLang.eveningGreetings;
        break;
      case >= 20 && < 23:
        greeting = myLang.nightGreetings;
        break;
      case >= 23 || < 4:
        greeting = myLang.midNightGreetings;
        break;
      default:
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (0.18 * deviceHeight).clamp(100, 150),
              padding: .all(30),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                children: [
                  Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$greeting, $userName',
                            style: TextStyle(
                              fontSize: (0.02 * deviceHeight).clamp(10, 20),
                            ),
                          ),
                          Text('\u{1F60A}'),
                        ],
                      ),
                      Text(
                        fullTime,
                        style: TextStyle(
                          fontSize: (0.02 * deviceHeight).clamp(10, 20),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/icons/mohammad_logo.png",
                    width: (0.15 * deviceHeight).clamp(30, 150),
                    fit: .cover,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: .start,
              spacing: 12,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: .center,
                    spacing: 10,
                    children: [
                      Text(
                        myLang.mainGreeting,
                        style: TextStyle(
                          fontSize: (0.05 * deviceHeight).clamp(20, 38),
                          fontWeight: .w900,
                          fontFamily: mainGreetingFont,
                        ),
                      ),
                      Text(
                        myLang.mainSubTitle,
                        style: TextStyle(
                          fontSize: (0.02 * deviceHeight).clamp(10, 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/mosque_for_main_page.png',
                    fit: .cover,
                    height: (0.25 * deviceHeight).clamp(30, 400),
                    width: (deviceWidth),
                  ),
                ),
                RecommondedSunnahs(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecommondedSunnahs extends StatelessWidget {
  const RecommondedSunnahs({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var myLang = AppLocalizations.of(context)!;
    return Column(
      spacing: 12,
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: .symmetric(horizontal: 30),
          child: Text(
            myLang.recommondedSunnahs,
            style: TextStyle(
              fontWeight: .w600,
              fontSize: (0.02 * deviceHeight).clamp(5, 17),
            ),
          ),
        ),
        RecSunList(),
      ],
    );
  }
}

class RecSunList extends StatefulWidget {
  const RecSunList({super.key});

  @override
  State<RecSunList> createState() => _RecSunListState();
}

class _RecSunListState extends State<RecSunList> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final myLang = AppLocalizations.of(context)!;
    String title1 = myLang.morningZikr;
    String title2 = myLang.miswak;
    String title3 = myLang.ishraqPrayer;
    dynamic leading = Image.asset(
      'assets/icons/sunrise-morning-svgrepo-com.png',
    );
    dynamic trailing1 = Image.asset('assets/icons/tasbih_2903103.png');
    dynamic trailing2 = Image.asset('assets/icons/miswak_10324653.png');
    dynamic trailing3 = Image.asset(
      'assets/icons/praying-muslim-kids-cartoon-flat-illustration-png.webp',
    );
    Widget tab1 = ZikrPage();
    Widget tab2 = DiscreptionPage(
      title: myLang.miswak,
      discreption: myLang.usingMiswakAfterWaking,
    );
    Widget tab3 = DiscreptionPage(
      title: myLang.ishraqPrayer,
      discreption: myLang.ishraqPrayerDiscreption,
    );

    void setInfo({
      newTitle1,
      newTitle2,
      newTitle3,
      newLeading,
      newTrailing1,
      newTrailing2,
      newTrailing3,
      newTab1,
      newTab2,
      newTab3,
    }) {
      setState(() {
        title1 = newTitle1;
        title2 = newTitle2;
        title3 = newTitle3;
        leading = newLeading;
        trailing1 = newTrailing1;
        trailing2 = newTrailing2;
        trailing3 = newTrailing3;
        tab1 = newTab1;
        tab2 = newTab2;
        tab3 = newTab3;
      });
    }

    switch (hourNow) {
      case >= 9 && < 15:
        setInfo(
          newTitle1: myLang.qailola,
          newTitle2: myLang.dhuhaPrayer,
          newTitle3: myLang.quran,
          newLeading: SvgPicture.asset(
            'assets/icons/sun-svgrepo-com.svg',
            width: (deviceWidth * 0.15).clamp(10, 70),
          ),
          newTrailing1: Image.asset('assets/icons/sleep_icon.webp'),
          newTrailing2: Image.asset(
            'assets/icons/praying-muslim-kids-cartoon-flat-illustration-png.webp',
          ),
          newTrailing3: Image.asset('assets/icons/quran_icon.png'),
          newTab1: DiscreptionPage(
            title: myLang.qailola,
            discreption: myLang.qailolaDisc,
          ),
          newTab2: DiscreptionPage(
            title: myLang.dhuhaPrayer,
            discreption: myLang.duhaPrayer,
          ),
          newTab3: DiscreptionPage(
            title: myLang.quran,
            discreption: myLang.monthlyQuranCompletion,
          ),
        );
        break;
      case >= 15 && < 20:
        setInfo(
          newTitle1: myLang.eveningZikr,
          newTitle2: myLang.surahMulk,
          newTitle3: myLang.surahSajda,
          newLeading: SvgPicture.asset(
            'assets/icons/sunset-svgrepo-com.svg',
            width: (deviceWidth * 0.15).clamp(10, 70),
          ),
          newTrailing1: Image.asset('assets/icons/tasbih_2903103.png'),
          newTrailing2: Image.asset('assets/icons/surah_mulk.png'),
          newTrailing3: Image.asset('assets/icons/sajda.png'),
          newTab1: ZikrPage(),
          newTab2: DiscreptionPage(
            title: myLang.surahMulk,
            discreption: myLang.surahMulkDisc,
          ),
          newTab3: DiscreptionPage(
            title: myLang.surahSajda,
            discreption: myLang.surahMulkDisc,
          ),
        );
        break;
      case >= 20 && < 23:
        setInfo(
          newTitle1: myLang.miswak,
          newTitle2: myLang.surahWaqiah,
          newTitle3: myLang.beforeNightZikr,
          newLeading: SvgPicture.asset(
            'assets/icons/moon-stars-svgrepo-com.svg',
            width: (deviceWidth * 0.15).clamp(10, 70),
          ),
          newTrailing1: Image.asset('assets/icons/miswak_10324653.png'),
          newTrailing2: Image.asset('assets/icons/waqiah.png'),
          newTrailing3: Image.asset('assets/icons/tasbih_2903103.png'),
          newTab1: DiscreptionPage(
            title: myLang.miswak,
            discreption: myLang.usingMiswakAfterWaking,
          ),
          newTab2: DiscreptionPage(
            title: myLang.surahWaqiah,
            discreption: myLang.waqiahDisc,
          ),
          newTab3: ZikrPage(),
        );
        break;
      case >= 23 || < 4:
        setInfo(
          newTitle1: myLang.qyamUlLail,
          newTitle2: myLang.surahYasin,
          newTitle3: myLang.astaghfar,
          newLeading: SvgPicture.asset(
            'assets/icons/night-software-star-svgrepo-com.svg',
          ),
          newTrailing1: Image.asset('assets/icons/night_prayer.png'),
          newTrailing2: Image.asset('assets/icons/yasin_logo.png'),
          newTrailing3: Image.asset(
            'assets/icons/red-astaghfar-astaghfirullah-calligraphy-arabic-text-illustration-design_332205-234.jpg',
          ),
          newTab1: DiscreptionPage(
            title: myLang.qyamUlLail,
            discreption: myLang.qiyamAlLayl,
          ),
          newTab2: DiscreptionPage(
            title: myLang.surahYasin,
            discreption: myLang.yasinDisc,
          ),
          newTab3: DiscreptionPage(
            title: myLang.astaghfar,
            discreption: myLang.istighfarDisc,
          ),
        );
        break;
      default:
    }

    final List<Widget> nextTabList = [tab1, tab2, tab3];

    List<RecSunItem> listOfWidget = [
      RecSunItem(
        leading: leading,
        title: title1,
        trailing: trailing1,
        onTapTab: tab1,
      ),
      RecSunItem(
        leading: leading,
        title: title2,
        trailing: trailing2,
        onTapTab: null,
      ),
      RecSunItem(
        leading: leading,
        title: title3,
        trailing: trailing3,
        onTapTab: null,
      ),
    ];

    return SizedBox(
      height: 300,
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 99,
        diameterRatio: 1.2,
        children: List.generate(listOfWidget.length, (index) {
          final item = listOfWidget[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
              color: secondryWhite,
            ),
            height: 99,
            margin: .symmetric(horizontal: 30),
            child: Center(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextTabList[index]),
                  );
                },
                leading: item.leading,
                title: Text(
                  item.title.toString(),
                  style: TextStyle(
                    fontWeight: .w700,
                    fontSize: (0.05 * deviceWidth).clamp(10, 20),
                    color: Colors.black,
                  ),
                  textAlign: .center,
                ),
                trailing: item.trailing,
              ),
            ),
          );
        }),
      ),
    );
  }
}

class RecSunItem {
  dynamic leading;
  String? title;
  dynamic trailing;
  Widget? onTapTab;

  RecSunItem({this.leading, this.title, this.trailing, this.onTapTab});
}

// class RecSunList extends StatelessWidget {
//   const RecSunList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;
//     var myLang = AppLocalizations.of(context)!;
//     List<Map<String, Widget>> items = [
//       {
//         "title": Text(
//           myLang.morningZikr,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         ),
//         "icon": Image.asset('assets/icons/tasbih_2903103.png'),
//       },
//       {
//         "title": Text(
//           myLang.miswak,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         ),
//         "icon": Image.asset('assets/icons/miswak_10324653.png'),
//       },
//       {
//         "title": Text(
//           myLang.ishraqPrayer,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         ),
//         "icon": Image.asset(
//           'assets/icons/praying-muslim-kids-cartoon-flat-illustration-png.webp',
//         ),
//       },
//     ];
//     Widget timeBaseIcon = Image.asset(
//       'assets/icons/sunrise-morning-svgrepo-com.png',
//       width: (0.15 * deviceWidth).clamp(10, 70),
//       fit: .cover,
//     );

//     switch (hourNow) {
//       case >= 9 && < 15:
//         items[0]["title"] = Text(
//           myLang.qailola,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[0]["icon"] = Image.asset(
//           'assets/icons/sleep_icon.webp',
//           fit: .cover,
//           cacheWidth: 200,
//         );
//         items[1]["title"] = Text(
//           myLang.dhuhaPrayer,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[1]["icon"] = Image.asset(
//           'assets/icons/praying-muslim-kids-cartoon-flat-illustration-png.webp',
//           fit: .cover,
//         );
//         items[2]["title"] = Text(
//           myLang.quran,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[2]["icon"] = Image.asset(
//           'assets/icons/quran_icon.png',
//           fit: .cover,
//         );
//         timeBaseIcon = SvgPicture.asset(
//           "assets/icons/sun-svgrepo-com.svg",
//           width: (0.15 * deviceWidth).clamp(10, 70),
//           fit: .cover,
//         );
//         break;
//       case >= 15 && < 20:
//         items[0]["title"] = Text(
//           myLang.eveningZikr,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[0]["icon"] = Image.asset(
//           'assets/icons/tasbih_2903103.png',
//           fit: .cover,
//         );
//         items[1]["title"] = Text(
//           myLang.surahMulk,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[1]["icon"] = Image.asset(
//           'assets/icons/surah_mulk.png',
//           fit: .cover,
//         );
//         items[2]["title"] = Text(
//           myLang.surahSajda,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[2]["icon"] = Image.asset('assets/icons/sajda.png', fit: .cover);
//         timeBaseIcon = SvgPicture.asset(
//           "assets/icons/sunset-svgrepo-com.svg",
//           width: (0.15 * deviceWidth).clamp(10, 70),
//           fit: .cover,
//         );
//         break;
//       case >= 20 && < 23:
//         items[0]["title"] = Text(
//           myLang.miswak,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[0]["icon"] = Image.asset(
//           'assets/icons/miswak_10324653.png',
//           fit: .cover,
//         );
//         items[1]["title"] = Text(
//           myLang.surahWaqiah,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[1]["icon"] = Image.asset('assets/icons/waqiah.png', fit: .cover);
//         items[2]["title"] = Text(
//           myLang.beforeNightZikr,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[2]["icon"] = Image.asset(
//           'assets/icons/tasbih_2903103.png',
//           fit: .cover,
//         );
//         timeBaseIcon = SvgPicture.asset(
//           "assets/icons/moon-stars-svgrepo-com.svg",
//           width: (0.15 * deviceWidth).clamp(10, 70),
//           fit: .cover,
//         );
//         break;
//       case >= 23 || < 4:
//         items[0]["title"] = Text(
//           myLang.qyamUlLail,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[0]["icon"] = Image.asset(
//           'assets/icons/night_prayer.png',
//           fit: .cover,
//         );
//         items[1]["title"] = Text(
//           myLang.surahYasin,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[1]["icon"] = Image.asset(
//           'assets/icons/yasin_logo.png',
//           fit: .cover,
//         );
//         items[2]["title"] = Text(
//           myLang.astaghfar,
//           style: TextStyle(
//             fontWeight: .w700,
//             fontSize: (0.05 * deviceWidth).clamp(10, 20),
//             color: Colors.black,
//           ),
//         );
//         items[2]["icon"] = Image.asset(
//           'assets/icons/red-astaghfar-astaghfirullah-calligraphy-arabic-text-illustration-design_332205-234.jpg',
//           fit: .cover,
//         );
//         timeBaseIcon = SvgPicture.asset(
//           "assets/icons/night-software-star-svgrepo-com.svg",
//           width: (0.15 * deviceWidth).clamp(10, 70),
//           fit: .cover,
//         );
//         break;
//       default:
//     }

//     return Column(
//       spacing: (0.012 * deviceHeight).clamp(0.5, 12),
//       children: [
//         TextButton(
//           style: ButtonStyle(
//             padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(0)),
//           ),
//           onPressed: () {
//             if (hourNow >= 4 || hourNow <= 9) {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ZikrPage(),));
//             }
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//             width: .infinity,
//             height: (0.10 * deviceHeight).clamp(5, 99),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromRGBO(0, 0, 0, 0.25),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                 ),
//               ],
//               color: secondryWhite,
//             ),
//             child: Row(
//               mainAxisAlignment: .spaceBetween,
//               children: [timeBaseIcon, items[0]['title']!, items[0]['icon']!],
//             ),
//           ),
//         ),
//         TextButton(
//           style: ButtonStyle(
//             padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(0)),
//           ),
//           onPressed: () {},
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//             width: .infinity,
//             height: (0.10 * deviceHeight).clamp(5, 99),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromRGBO(0, 0, 0, 0.25),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                 ),
//               ],
//               color: secondryWhite,
//             ),
//             child: Row(
//               mainAxisAlignment: .spaceBetween,
//               children: [timeBaseIcon, items[1]['title']!, items[1]['icon']!],
//             ),
//           ),
//         ),
//         TextButton(
//           style: ButtonStyle(
//             padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(0)),
//           ),
//           onPressed: () {},
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//             width: .infinity,
//             height: (0.10 * deviceHeight).clamp(5, 99),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromRGBO(0, 0, 0, 0.25),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                 ),
//               ],
//               color: secondryWhite,
//             ),
//             child: Row(
//               mainAxisAlignment: .spaceBetween,
//               children: [timeBaseIcon, items[2]['title']!, items[2]['icon']!],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
