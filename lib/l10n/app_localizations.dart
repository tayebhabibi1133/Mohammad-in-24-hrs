import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_ps.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('ps'),
    Locale('ru'),
    Locale('zh'),
  ];

  /// No description provided for @englishLang.
  ///
  /// In en, this message translates to:
  /// **'🇺🇸 English'**
  String get englishLang;

  /// No description provided for @persianLang.
  ///
  /// In en, this message translates to:
  /// **'🇦🇫 Persian'**
  String get persianLang;

  /// No description provided for @pashtoLang.
  ///
  /// In en, this message translates to:
  /// **'🇦🇫 Pashto'**
  String get pashtoLang;

  /// No description provided for @arabicLang.
  ///
  /// In en, this message translates to:
  /// **'🇸🇦 Arabic'**
  String get arabicLang;

  /// No description provided for @spanishLang.
  ///
  /// In en, this message translates to:
  /// **'🇪🇸 Spanish'**
  String get spanishLang;

  /// No description provided for @germanLang.
  ///
  /// In en, this message translates to:
  /// **'🇩🇪 Germany'**
  String get germanLang;

  /// No description provided for @russianLang.
  ///
  /// In en, this message translates to:
  /// **'🇷🇺 Russian'**
  String get russianLang;

  /// No description provided for @chineseLang.
  ///
  /// In en, this message translates to:
  /// **'🇨🇳 Chinese'**
  String get chineseLang;

  /// No description provided for @azkarPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Azkar'**
  String get azkarPageTitle;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete!'**
  String get complete;

  /// No description provided for @click.
  ///
  /// In en, this message translates to:
  /// **'Click!'**
  String get click;

  /// No description provided for @yasinDisc.
  ///
  /// In en, this message translates to:
  /// **'Reading this surah specially at mornings can make the coming day much better'**
  String get yasinDisc;

  /// No description provided for @istighfarDisc.
  ///
  /// In en, this message translates to:
  /// **'Allah loves repentation so don\'t be disappointed do your best to be fogiven now!'**
  String get istighfarDisc;

  /// No description provided for @waqiahDisc.
  ///
  /// In en, this message translates to:
  /// **'Reading Surat ul Waqiah in night time is for being protected from poverty and its a special reminder for DoomsDay'**
  String get waqiahDisc;

  /// No description provided for @surahMulkDisc.
  ///
  /// In en, this message translates to:
  /// **'Reading this surah specially 30 first ayahs of it in night time can be an intercessioner for forgivness'**
  String get surahMulkDisc;

  /// No description provided for @qailolaDisc.
  ///
  /// In en, this message translates to:
  /// **'Its a midday nap that can be from 15 minutes to 1 hours for gaining more energy for day or qiyam'**
  String get qailolaDisc;

  /// No description provided for @ishraqPrayerDiscreption.
  ///
  /// In en, this message translates to:
  /// **'Ishraq prayer is something special that can be performed after sun rises completly.It will remind about Allah'**
  String get ishraqPrayerDiscreption;

  /// No description provided for @selectLang.
  ///
  /// In en, this message translates to:
  /// **'Select your language'**
  String get selectLang;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next!'**
  String get next;

  /// No description provided for @permissionAlertContent.
  ///
  /// In en, this message translates to:
  /// **'To ensure your Sunnah reminders arrive exactly on time, please allow \'Alarms & Reminders\' in the next screen.'**
  String get permissionAlertContent;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'ENABLE NOW!'**
  String get enable;

  /// No description provided for @howCanI.
  ///
  /// In en, this message translates to:
  /// **'Anyone with a healthy mind wants to be like him PBUH after reading about him.\n But the thing is How Can You Be Like Him?\n We will help you 😊! \n Yes! we will help you to have a character like him;Respected, Kind, Leader, Disciplined and Finally a \nHUMAN!'**
  String get howCanI;

  /// No description provided for @didYouKnow.
  ///
  /// In en, this message translates to:
  /// **'Did You Know?'**
  String get didYouKnow;

  /// No description provided for @expectations.
  ///
  /// In en, this message translates to:
  /// **'The only thing that you should do is to go through our Library, choose which Sunnah you like and we will give you Notifications. \n We will also Remind you about things that will help you to gain that Brilliant Character \n but! Are you ready to build yourself\'s BEST for this Life and Afterlife?'**
  String get expectations;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'I\'m Ready! 😮‍💨'**
  String get ready;

  /// No description provided for @aboutMohammad.
  ///
  /// In en, this message translates to:
  /// **'Did You Know that Mohammad PBUH was known for a character so beautiful that even his enemies trusted him, as he was always truthful, kind, and deeply compassionate.\n He cared for the poor, forgave those who harmed him even when he had the power to punish them and lived with humility despite being a great LEADER; he transformed society with justice and mercy, teaching people to be honest, patient, and respectful, and becoming like him is not something SMALL.\n it is an acheivement by itself, a path that raises your character and your worth every single day.'**
  String get aboutMohammad;

  /// No description provided for @selectLangContent.
  ///
  /// In en, this message translates to:
  /// **'Hey Dear! \nLanguages and Names are the first connectors between you and me so first select which Language you feel yourself comfortable with and then tell what can I call you.'**
  String get selectLangContent;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name........'**
  String get enterName;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get changeTheme;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLang;

  /// No description provided for @credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits;

  /// No description provided for @morningGreetings.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get morningGreetings;

  /// No description provided for @eveningGreetings.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get eveningGreetings;

  /// No description provided for @mainGreeting.
  ///
  /// In en, this message translates to:
  /// **'Salam\'un Alaikum'**
  String get mainGreeting;

  /// No description provided for @mainSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Following the Authentic Sunnah, Way to Paradise'**
  String get mainSubTitle;

  /// No description provided for @noonGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good Noon'**
  String get noonGreeting;

  /// No description provided for @nightGreetings.
  ///
  /// In en, this message translates to:
  /// **'Good Night'**
  String get nightGreetings;

  /// No description provided for @midNightGreetings.
  ///
  /// In en, this message translates to:
  /// **'Good MidNight'**
  String get midNightGreetings;

  /// No description provided for @alertBoxTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Succesfully'**
  String get alertBoxTitle;

  /// No description provided for @alertBoxContent.
  ///
  /// In en, this message translates to:
  /// **'This Sunnah is now available in Selecteds tabs you can assign a reminder there'**
  String get alertBoxContent;

  /// No description provided for @alertBoxActionGoToSelected.
  ///
  /// In en, this message translates to:
  /// **'Go to Selected'**
  String get alertBoxActionGoToSelected;

  /// No description provided for @alertBoxActionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get alertBoxActionDone;

  /// No description provided for @savedReminderMessege.
  ///
  /// In en, this message translates to:
  /// **'Reminder Activated!'**
  String get savedReminderMessege;

  /// No description provided for @saveReminderButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save and Enable Reminder'**
  String get saveReminderButtonText;

  /// No description provided for @deletingReminder.
  ///
  /// In en, this message translates to:
  /// **'Deleting Sunnah'**
  String get deletingReminder;

  /// No description provided for @deletingReminderSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Deleted Successfully!'**
  String get deletingReminderSnackbar;

  /// No description provided for @deletingReminderContent.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete this Sunnah from Selected? It will not Remind you again if you delete it!'**
  String get deletingReminderContent;

  /// No description provided for @deletingReminderCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deletingReminderCancel;

  /// No description provided for @deletingReminderDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete It!'**
  String get deletingReminderDelete;

  /// No description provided for @navBarMain.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get navBarMain;

  /// No description provided for @navBarLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get navBarLibrary;

  /// No description provided for @navBarSelected.
  ///
  /// In en, this message translates to:
  /// **'Seleted'**
  String get navBarSelected;

  /// No description provided for @navBarMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navBarMore;

  /// No description provided for @recommondedSunnahs.
  ///
  /// In en, this message translates to:
  /// **'Recommonded Sunnahs for now:'**
  String get recommondedSunnahs;

  /// No description provided for @morningZikr.
  ///
  /// In en, this message translates to:
  /// **'Morning Azkar'**
  String get morningZikr;

  /// No description provided for @miswak.
  ///
  /// In en, this message translates to:
  /// **'Miswak'**
  String get miswak;

  /// No description provided for @ishraqPrayer.
  ///
  /// In en, this message translates to:
  /// **'Ishraq Prayer'**
  String get ishraqPrayer;

  /// No description provided for @qailola.
  ///
  /// In en, this message translates to:
  /// **'Midday Rest\n(Qailula)'**
  String get qailola;

  /// No description provided for @dhuhaPrayer.
  ///
  /// In en, this message translates to:
  /// **'Dhuha Prayer'**
  String get dhuhaPrayer;

  /// No description provided for @quran.
  ///
  /// In en, this message translates to:
  /// **'Read Quran'**
  String get quran;

  /// No description provided for @eveningZikr.
  ///
  /// In en, this message translates to:
  /// **'Evening Azkar'**
  String get eveningZikr;

  /// No description provided for @surahMulk.
  ///
  /// In en, this message translates to:
  /// **'Surat ul Mulk'**
  String get surahMulk;

  /// No description provided for @surahSajda.
  ///
  /// In en, this message translates to:
  /// **'Surat ul Sajda'**
  String get surahSajda;

  /// No description provided for @surahWaqiah.
  ///
  /// In en, this message translates to:
  /// **'Surat ul Waqiah'**
  String get surahWaqiah;

  /// No description provided for @beforeNightZikr.
  ///
  /// In en, this message translates to:
  /// **'Zikr Before Sleep'**
  String get beforeNightZikr;

  /// No description provided for @qyamUlLail.
  ///
  /// In en, this message translates to:
  /// **'Midnight Prayers\n(Qyam ul Lail)'**
  String get qyamUlLail;

  /// No description provided for @surahYasin.
  ///
  /// In en, this message translates to:
  /// **'Surat ul Yasin'**
  String get surahYasin;

  /// No description provided for @astaghfar.
  ///
  /// In en, this message translates to:
  /// **'Astaghfar'**
  String get astaghfar;

  /// No description provided for @selectedSunnahTitle.
  ///
  /// In en, this message translates to:
  /// **'Selected Sunnahs'**
  String get selectedSunnahTitle;

  /// No description provided for @nullScreenAlert.
  ///
  /// In en, this message translates to:
  /// **'No Sunnahs selected yet.'**
  String get nullScreenAlert;

  /// No description provided for @libraryAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Library of Sunnahs'**
  String get libraryAppBarTitle;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Mornings'**
  String get morning;

  /// No description provided for @timeBased.
  ///
  /// In en, this message translates to:
  /// **'Time Based'**
  String get timeBased;

  /// No description provided for @worshipSunnahs.
  ///
  /// In en, this message translates to:
  /// **'Worship'**
  String get worshipSunnahs;

  /// No description provided for @socialSunnahs.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get socialSunnahs;

  /// No description provided for @spritualSunnahs.
  ///
  /// In en, this message translates to:
  /// **'Character'**
  String get spritualSunnahs;

  /// No description provided for @addBookmark.
  ///
  /// In en, this message translates to:
  /// **'Add to Selected'**
  String get addBookmark;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear Tracker History'**
  String get clearHistory;

  /// No description provided for @libraryWipingFace.
  ///
  /// In en, this message translates to:
  /// **'Wiping face'**
  String get libraryWipingFace;

  /// No description provided for @libraryAlhamdulillahAfterWaking.
  ///
  /// In en, this message translates to:
  /// **'Alhamdulillah after waking'**
  String get libraryAlhamdulillahAfterWaking;

  /// No description provided for @libraryUsingMiswak.
  ///
  /// In en, this message translates to:
  /// **'Using miswak'**
  String get libraryUsingMiswak;

  /// No description provided for @libraryCleaningNoseThreeTimes.
  ///
  /// In en, this message translates to:
  /// **'Cleaning nose 3 times'**
  String get libraryCleaningNoseThreeTimes;

  /// No description provided for @libraryWashingHandsBeforeWater.
  ///
  /// In en, this message translates to:
  /// **'Washing hands before putting into water'**
  String get libraryWashingHandsBeforeWater;

  /// No description provided for @librarySunnahFajr.
  ///
  /// In en, this message translates to:
  /// **'Sunnah of Fajr'**
  String get librarySunnahFajr;

  /// No description provided for @librarySittingAfterFajrUntilSunrise.
  ///
  /// In en, this message translates to:
  /// **'Sitting after Fajr until sunrise'**
  String get librarySittingAfterFajrUntilSunrise;

  /// No description provided for @libraryMorningAdhkar.
  ///
  /// In en, this message translates to:
  /// **'Morning adhkar'**
  String get libraryMorningAdhkar;

  /// No description provided for @libraryDuhaPrayer.
  ///
  /// In en, this message translates to:
  /// **'Duha prayer'**
  String get libraryDuhaPrayer;

  /// No description provided for @libraryRawatibPrayers.
  ///
  /// In en, this message translates to:
  /// **'Rawatib prayers (before/after obligatory prayers)'**
  String get libraryRawatibPrayers;

  /// No description provided for @librarySunnahBeforeAsr.
  ///
  /// In en, this message translates to:
  /// **'Sunnah before Asr'**
  String get librarySunnahBeforeAsr;

  /// No description provided for @librarySunnahBeforeMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Sunnah before Maghrib'**
  String get librarySunnahBeforeMaghrib;

  /// No description provided for @librarySunnahBeforeIsha.
  ///
  /// In en, this message translates to:
  /// **'Sunnah before Isha'**
  String get librarySunnahBeforeIsha;

  /// No description provided for @libraryEveningAdhkar.
  ///
  /// In en, this message translates to:
  /// **'Evening adhkar'**
  String get libraryEveningAdhkar;

  /// No description provided for @librarySittingAfterMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Sitting after Maghrib'**
  String get librarySittingAfterMaghrib;

  /// No description provided for @libraryQiyamAlLayl.
  ///
  /// In en, this message translates to:
  /// **'Qiyam al-Layl'**
  String get libraryQiyamAlLayl;

  /// No description provided for @libraryWitr.
  ///
  /// In en, this message translates to:
  /// **'Witr'**
  String get libraryWitr;

  /// No description provided for @libraryNightDuas.
  ///
  /// In en, this message translates to:
  /// **'Night duas'**
  String get libraryNightDuas;

  /// No description provided for @librarySleepingOnRightSide.
  ///
  /// In en, this message translates to:
  /// **'Sleeping on right side'**
  String get librarySleepingOnRightSide;

  /// No description provided for @libraryDuasBeforeSleep.
  ///
  /// In en, this message translates to:
  /// **'Duas before sleep'**
  String get libraryDuasBeforeSleep;

  /// No description provided for @librarySayingBismillahInWudu.
  ///
  /// In en, this message translates to:
  /// **'Saying Bismillah in wudu'**
  String get librarySayingBismillahInWudu;

  /// No description provided for @libraryWashingLimbsThreeTimes.
  ///
  /// In en, this message translates to:
  /// **'Washing limbs 3 times'**
  String get libraryWashingLimbsThreeTimes;

  /// No description provided for @libraryKhilalBetweenFingersToes.
  ///
  /// In en, this message translates to:
  /// **'Khilal (between fingers/toes)'**
  String get libraryKhilalBetweenFingersToes;

  /// No description provided for @libraryMiswakDuringWudu.
  ///
  /// In en, this message translates to:
  /// **'Miswak during wudu'**
  String get libraryMiswakDuringWudu;

  /// No description provided for @libraryTwoRakahAfterWudu.
  ///
  /// In en, this message translates to:
  /// **'Two rak‘ah after wudu'**
  String get libraryTwoRakahAfterWudu;

  /// No description provided for @libraryRaisingHands.
  ///
  /// In en, this message translates to:
  /// **'Raising hands'**
  String get libraryRaisingHands;

  /// No description provided for @libraryDuaAlIstiftah.
  ///
  /// In en, this message translates to:
  /// **'Du‘a al-Istiftah'**
  String get libraryDuaAlIstiftah;

  /// No description provided for @libraryExtraTasbeehInRukuSujood.
  ///
  /// In en, this message translates to:
  /// **'Extra tasbeeh in ruku/sujood'**
  String get libraryExtraTasbeehInRukuSujood;

  /// No description provided for @libraryDuaBetweenTwoSujood.
  ///
  /// In en, this message translates to:
  /// **'Du‘a between two sujood'**
  String get libraryDuaBetweenTwoSujood;

  /// No description provided for @libraryLongerSujood.
  ///
  /// In en, this message translates to:
  /// **'Longer sujood'**
  String get libraryLongerSujood;

  /// No description provided for @librarySeekingRefugeBeforeRecitation.
  ///
  /// In en, this message translates to:
  /// **'Seeking refuge before recitation'**
  String get librarySeekingRefugeBeforeRecitation;

  /// No description provided for @librarySayingAmeen.
  ///
  /// In en, this message translates to:
  /// **'Saying Ameen'**
  String get librarySayingAmeen;

  /// No description provided for @libraryFullDhikrAfterRuku.
  ///
  /// In en, this message translates to:
  /// **'Full dhikr after ruku'**
  String get libraryFullDhikrAfterRuku;

  /// No description provided for @libraryEnterWithRightFoot.
  ///
  /// In en, this message translates to:
  /// **'Enter with right foot'**
  String get libraryEnterWithRightFoot;

  /// No description provided for @libraryDuaEnteringMosque.
  ///
  /// In en, this message translates to:
  /// **'Du‘a entering mosque'**
  String get libraryDuaEnteringMosque;

  /// No description provided for @libraryTahiyyatAlMasjid.
  ///
  /// In en, this message translates to:
  /// **'Tahiyyat al-Masjid'**
  String get libraryTahiyyatAlMasjid;

  /// No description provided for @libraryWalkingCalmly.
  ///
  /// In en, this message translates to:
  /// **'Walking calmly'**
  String get libraryWalkingCalmly;

  /// No description provided for @libraryUsingSutrah.
  ///
  /// In en, this message translates to:
  /// **'Using sutrah'**
  String get libraryUsingSutrah;

  /// No description provided for @libraryRepeatingAfterMuadhin.
  ///
  /// In en, this message translates to:
  /// **'Repeating after mu’adhin'**
  String get libraryRepeatingAfterMuadhin;

  /// No description provided for @librarySendingSalawat.
  ///
  /// In en, this message translates to:
  /// **'Sending salawat'**
  String get librarySendingSalawat;

  /// No description provided for @libraryDuaAfterAdhan.
  ///
  /// In en, this message translates to:
  /// **'Du‘a after adhan'**
  String get libraryDuaAfterAdhan;

  /// No description provided for @libraryMakingPersonalDua.
  ///
  /// In en, this message translates to:
  /// **'Making personal du‘a'**
  String get libraryMakingPersonalDua;

  /// No description provided for @librarySayingBismillah.
  ///
  /// In en, this message translates to:
  /// **'Saying Bismillah'**
  String get librarySayingBismillah;

  /// No description provided for @librarySalamUponEntering.
  ///
  /// In en, this message translates to:
  /// **'Salam upon entering'**
  String get librarySalamUponEntering;

  /// No description provided for @libraryDuaLeavingHome.
  ///
  /// In en, this message translates to:
  /// **'Du‘a leaving home'**
  String get libraryDuaLeavingHome;

  /// No description provided for @libraryMiswakWhenEntering.
  ///
  /// In en, this message translates to:
  /// **'Miswak when entering'**
  String get libraryMiswakWhenEntering;

  /// No description provided for @libraryWearingRightSideFirst.
  ///
  /// In en, this message translates to:
  /// **'Wearing right side first'**
  String get libraryWearingRightSideFirst;

  /// No description provided for @libraryDuaWhenWearingClothes.
  ///
  /// In en, this message translates to:
  /// **'Du‘a when wearing clothes'**
  String get libraryDuaWhenWearingClothes;

  /// No description provided for @libraryRemovingLeftSideFirst.
  ///
  /// In en, this message translates to:
  /// **'Removing left side first'**
  String get libraryRemovingLeftSideFirst;

  /// No description provided for @libraryBismillahBeforeEating.
  ///
  /// In en, this message translates to:
  /// **'Bismillah before eating'**
  String get libraryBismillahBeforeEating;

  /// No description provided for @libraryEatingWithRightHand.
  ///
  /// In en, this message translates to:
  /// **'Eating with right hand'**
  String get libraryEatingWithRightHand;

  /// No description provided for @libraryEatingWhatIsNear.
  ///
  /// In en, this message translates to:
  /// **'Eating what is near'**
  String get libraryEatingWhatIsNear;

  /// No description provided for @libraryDrinkingInThreeBreaths.
  ///
  /// In en, this message translates to:
  /// **'Drinking in three breaths'**
  String get libraryDrinkingInThreeBreaths;

  /// No description provided for @librarySmiling.
  ///
  /// In en, this message translates to:
  /// **'Smiling'**
  String get librarySmiling;

  /// No description provided for @librarySalam.
  ///
  /// In en, this message translates to:
  /// **'Salam'**
  String get librarySalam;

  /// No description provided for @libraryGoodIntention.
  ///
  /// In en, this message translates to:
  /// **'Good intention'**
  String get libraryGoodIntention;

  /// No description provided for @libraryRenewingIntentionInDailyActs.
  ///
  /// In en, this message translates to:
  /// **'Renewing intention in daily acts'**
  String get libraryRenewingIntentionInDailyActs;

  /// No description provided for @libraryTurningHabitsIntoWorship.
  ///
  /// In en, this message translates to:
  /// **'Turning habits into worship'**
  String get libraryTurningHabitsIntoWorship;

  /// No description provided for @libraryRememberingAllahConstantly.
  ///
  /// In en, this message translates to:
  /// **'Remembering Allah constantly'**
  String get libraryRememberingAllahConstantly;

  /// No description provided for @libraryGratitude.
  ///
  /// In en, this message translates to:
  /// **'Gratitude'**
  String get libraryGratitude;

  /// No description provided for @libraryReflectionOnBlessings.
  ///
  /// In en, this message translates to:
  /// **'Reflection on blessings'**
  String get libraryReflectionOnBlessings;

  /// No description provided for @libraryLeavingSinsToHelpQiyam.
  ///
  /// In en, this message translates to:
  /// **'Leaving sins to help Qiyam'**
  String get libraryLeavingSinsToHelpQiyam;

  /// No description provided for @libraryFightingNafs.
  ///
  /// In en, this message translates to:
  /// **'Fighting nafs'**
  String get libraryFightingNafs;

  /// No description provided for @libraryAvoidingInnovation.
  ///
  /// In en, this message translates to:
  /// **'Avoiding innovation'**
  String get libraryAvoidingInnovation;

  /// No description provided for @libraryTafakkurOnCreation.
  ///
  /// In en, this message translates to:
  /// **'Tafakkur on creation'**
  String get libraryTafakkurOnCreation;

  /// No description provided for @libraryMonthlyQuranCompletion.
  ///
  /// In en, this message translates to:
  /// **'Monthly Qur’an completion'**
  String get libraryMonthlyQuranCompletion;

  /// No description provided for @sayingBismillahGeneralTitle.
  ///
  /// In en, this message translates to:
  /// **'Saying Bismillah'**
  String get sayingBismillahGeneralTitle;

  /// No description provided for @salamUponEnteringTitle.
  ///
  /// In en, this message translates to:
  /// **'Salam Upon Entering'**
  String get salamUponEnteringTitle;

  /// No description provided for @duaLeavingHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Du‘a When Leaving Home'**
  String get duaLeavingHomeTitle;

  /// No description provided for @miswakWhenEnteringHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Miswak When Entering Home'**
  String get miswakWhenEnteringHomeTitle;

  /// No description provided for @wearingRightSideFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Wearing Right Side First'**
  String get wearingRightSideFirstTitle;

  /// No description provided for @duaWhenWearingClothesTitle.
  ///
  /// In en, this message translates to:
  /// **'Du‘a When Wearing Clothes'**
  String get duaWhenWearingClothesTitle;

  /// No description provided for @removingLeftSideFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Removing Left Side First'**
  String get removingLeftSideFirstTitle;

  /// No description provided for @bismillahBeforeEatingTitle.
  ///
  /// In en, this message translates to:
  /// **'Bismillah Before Eating'**
  String get bismillahBeforeEatingTitle;

  /// No description provided for @eatingWithRightHandTitle.
  ///
  /// In en, this message translates to:
  /// **'Eating with the Right Hand'**
  String get eatingWithRightHandTitle;

  /// No description provided for @eatingWhatIsNearTitle.
  ///
  /// In en, this message translates to:
  /// **'Eating What Is Near'**
  String get eatingWhatIsNearTitle;

  /// No description provided for @drinkingInThreeBreathsTitle.
  ///
  /// In en, this message translates to:
  /// **'Drinking in Three Breaths'**
  String get drinkingInThreeBreathsTitle;

  /// No description provided for @smilingTitle.
  ///
  /// In en, this message translates to:
  /// **'Smiling'**
  String get smilingTitle;

  /// No description provided for @givingSalamTitle.
  ///
  /// In en, this message translates to:
  /// **'Giving Salam'**
  String get givingSalamTitle;

  /// No description provided for @goodIntentionTitle.
  ///
  /// In en, this message translates to:
  /// **'Good Intention'**
  String get goodIntentionTitle;

  /// No description provided for @renewingIntentionTitle.
  ///
  /// In en, this message translates to:
  /// **'Renewing Intention'**
  String get renewingIntentionTitle;

  /// No description provided for @turningHabitsIntoWorshipTitle.
  ///
  /// In en, this message translates to:
  /// **'Turning Habits into Worship'**
  String get turningHabitsIntoWorshipTitle;

  /// No description provided for @rememberingAllahConstantlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Remembering Allah Constantly'**
  String get rememberingAllahConstantlyTitle;

  /// No description provided for @gratitudeTitle.
  ///
  /// In en, this message translates to:
  /// **'Gratitude'**
  String get gratitudeTitle;

  /// No description provided for @reflectionOnBlessingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reflection on Blessings'**
  String get reflectionOnBlessingsTitle;

  /// No description provided for @leavingSinsForQiyamTitle.
  ///
  /// In en, this message translates to:
  /// **'Leaving Sins to Help Qiyam'**
  String get leavingSinsForQiyamTitle;

  /// No description provided for @fightingNafsTitle.
  ///
  /// In en, this message translates to:
  /// **'Fighting the Nafs'**
  String get fightingNafsTitle;

  /// No description provided for @avoidingInnovationTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoiding Innovation'**
  String get avoidingInnovationTitle;

  /// No description provided for @tafakkurOnCreationTitle.
  ///
  /// In en, this message translates to:
  /// **'Tafakkur on Creation'**
  String get tafakkurOnCreationTitle;

  /// No description provided for @monthlyQuranCompletionTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly Qur’an Completion'**
  String get monthlyQuranCompletionTitle;

  /// No description provided for @wipingFaceAfterWaking.
  ///
  /// In en, this message translates to:
  /// **'Gently wiping the face upon waking is from the subtle and beautiful Sunnahs of the Prophet ﷺ. It removes the effects of sleep and helps you begin your day with awareness and remembrance of Allah.\n(Muslim 763)'**
  String get wipingFaceAfterWaking;

  /// No description provided for @sayingAlhamdulillahAfterWaking.
  ///
  /// In en, this message translates to:
  /// **'Begin your day with gratitude by saying: “Alhamdulillah alladhi ahyana ba‘da ma amatana…” — praising Allah who gave you life after sleep. This dhikr reconnects your heart to its purpose from the very first moment.\n(Bukhari 6312)'**
  String get sayingAlhamdulillahAfterWaking;

  /// No description provided for @usingMiswakAfterWaking.
  ///
  /// In en, this message translates to:
  /// **'Using the miswak after waking—especially at night—was beloved to the Prophet ﷺ. It purifies the mouth and prepares you for prayer and remembrance, combining physical cleanliness with spiritual readiness.\n(Bukhari 245, Muslim 255)'**
  String get usingMiswakAfterWaking;

  /// No description provided for @cleaningNoseThreeTimes.
  ///
  /// In en, this message translates to:
  /// **'Blowing the nose three times after waking is a Sunnah that promotes cleanliness and refreshes the body. The Prophet ﷺ taught it as part of restoring purity after sleep.\n(Bukhari 3295, Muslim 238)'**
  String get cleaningNoseThreeTimes;

  /// No description provided for @washingHandsBeforeWater.
  ///
  /// In en, this message translates to:
  /// **'Before placing your hands into water after waking, wash them three times. This Sunnah protects you from unseen impurities and builds mindfulness in daily actions.\n(Bukhari 162, Muslim 278)'**
  String get washingHandsBeforeWater;

  /// No description provided for @sunnahOfFajr.
  ///
  /// In en, this message translates to:
  /// **'The two light rak‘ahs before Fajr are more valuable than the entire world and everything in it. Guard them, and you preserve one of the greatest treasures of your day.\n(Muslim 725)'**
  String get sunnahOfFajr;

  /// No description provided for @sittingAfterFajr.
  ///
  /// In en, this message translates to:
  /// **'Remaining seated after Fajr remembering Allah until sunrise brings tranquility, barakah, and immense reward. It sets a powerful spiritual tone for your entire day.\n(Muslim 670)'**
  String get sittingAfterFajr;

  /// No description provided for @morningAdhkar.
  ///
  /// In en, this message translates to:
  /// **'Whoever maintains the morning adhkar surrounds themselves with divine protection. These remembrances strengthen the heart, bring peace, and guard you throughout the day.\n(Muslim 2723)'**
  String get morningAdhkar;

  /// No description provided for @duhaPrayer.
  ///
  /// In en, this message translates to:
  /// **'Praying Duha is like giving charity on behalf of every joint in your body. It is a beautiful expression of gratitude for health, movement, and life itself.\n(Muslim 720)'**
  String get duhaPrayer;

  /// No description provided for @rawatibDaily.
  ///
  /// In en, this message translates to:
  /// **'Whoever consistently prays 12 rak‘ah of Sunnah daily will have a house built for them in Jannah. These small daily acts carry immense eternal reward.\n(Muslim 728)'**
  String get rawatibDaily;

  /// No description provided for @sunnahBeforeAsr.
  ///
  /// In en, this message translates to:
  /// **'The Prophet ﷺ prayed for mercy upon those who pray four rak‘ah before ‘Asr. A few extra moments can earn you the mercy of Allah.\n(Abu Dawud 1271, Tirmidhi 430 – Hasan)'**
  String get sunnahBeforeAsr;

  /// No description provided for @sunnahBeforeMaghrib.
  ///
  /// In en, this message translates to:
  /// **'The Prophet ﷺ encouraged praying before Maghrib for whoever wishes. It is a simple opportunity to gain extra reward before the obligatory prayer.\n(Bukhari 1183)'**
  String get sunnahBeforeMaghrib;

  /// No description provided for @sunnahBeforeIsha.
  ///
  /// In en, this message translates to:
  /// **'Between the adhan and iqamah there is an opportunity for prayer. Use these blessed moments to draw closer to Allah before Isha.\n(Bukhari 624, Muslim 838)'**
  String get sunnahBeforeIsha;

  /// No description provided for @eveningAdhkar.
  ///
  /// In en, this message translates to:
  /// **'Evening adhkar are a shield for your night. They protect you, calm your heart, and prepare you to rest under Allah’s care.\n(Muslim 2723)'**
  String get eveningAdhkar;

  /// No description provided for @sittingAfterMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Remaining in your place after prayer for dhikr brings continuous reward and strengthens your connection with Allah.\n(Muslim 670)'**
  String get sittingAfterMaghrib;

  /// No description provided for @qiyamAlLayl.
  ///
  /// In en, this message translates to:
  /// **'The best prayer after the obligatory prayers is the night prayer. In the quiet of the night, your connection with Allah becomes deeper and more sincere.\n(Muslim 1163)'**
  String get qiyamAlLayl;

  /// No description provided for @witrPrayer.
  ///
  /// In en, this message translates to:
  /// **'Witr is a highly emphasized Sunnah. Do not leave it, as it completes your night and seals your day with worship and remembrance.\n(Abu Dawud 1416, Tirmidhi 453)'**
  String get witrPrayer;

  /// No description provided for @nightDuas.
  ///
  /// In en, this message translates to:
  /// **'Whoever wakes at night and remembers Allah with the prescribed supplications will have their دعا accepted. These moments are rare opportunities for closeness.\n(Bukhari 1154)'**
  String get nightDuas;

  /// No description provided for @sleepingRightSide.
  ///
  /// In en, this message translates to:
  /// **'Sleeping on your right side follows the Sunnah of the Prophet ﷺ and brings both physical comfort and spiritual benefit.\n(Bukhari 6311, Muslim 2710)'**
  String get sleepingRightSide;

  /// No description provided for @duasBeforeSleep.
  ///
  /// In en, this message translates to:
  /// **'Ending your day with supplications places your trust in Allah. Your soul rests under His protection, and waking again is a mercy from Him.\n(Bukhari 6320, Muslim 2714)'**
  String get duasBeforeSleep;

  /// No description provided for @bismillahWudu.
  ///
  /// In en, this message translates to:
  /// **'Begin your ablution with \'Bismillah\' to fill your action with blessing and intention, turning a routine act into worship.\n(Abu Dawud 101; Tirmidhi 25)'**
  String get bismillahWudu;

  /// No description provided for @washingLimbsThreeTimes.
  ///
  /// In en, this message translates to:
  /// **'Washing each limb up to three times during wudu follows the complete practice of the Prophet ﷺ and ensures both cleanliness and reward.\n(Bukhari 159; Muslim 226)'**
  String get washingLimbsThreeTimes;

  /// No description provided for @khilalFingersToes.
  ///
  /// In en, this message translates to:
  /// **'Passing water between the fingers and toes perfects your ablution and reflects attention to detail in worship.\n(Abu Dawud 142; Tirmidhi 38)'**
  String get khilalFingersToes;

  /// No description provided for @miswakDuringWudu.
  ///
  /// In en, this message translates to:
  /// **'Using the miswak during wudu combines purification of the body and mouth, preparing you fully for prayer.\n(Ahmad 7406; Nasa’i 5)'**
  String get miswakDuringWudu;

  /// No description provided for @twoRakahAfterWudu.
  ///
  /// In en, this message translates to:
  /// **'Praying two rak‘ah after wudu is a special act that brings great reward and opens doors of Jannah.\n(Bukhari 1149; Muslim 245)'**
  String get twoRakahAfterWudu;

  /// No description provided for @raisingHandsInPrayer.
  ///
  /// In en, this message translates to:
  /// **'Raising the hands at specific points in prayer follows the precise Sunnah and increases humility and attentiveness.\n(Bukhari 735)'**
  String get raisingHandsInPrayer;

  /// No description provided for @duaIstiftah.
  ///
  /// In en, this message translates to:
  /// **'Reciting the opening supplication after the first takbir prepares your heart to stand before Allah with focus and sincerity.\n(Muslim 399)'**
  String get duaIstiftah;

  /// No description provided for @extraTasbeehRukuSujood.
  ///
  /// In en, this message translates to:
  /// **'Repeating tasbeeh multiple times in ruku and sujood deepens your humility and strengthens your connection with Allah.\n(Muslim 772)'**
  String get extraTasbeehRukuSujood;

  /// No description provided for @duaBetweenTwoSujood.
  ///
  /// In en, this message translates to:
  /// **'Saying \'Rabbi ighfir li\' between the two prostrations is a moment to seek forgiveness with sincerity and humility.\n(Abu Dawud 850)'**
  String get duaBetweenTwoSujood;

  /// No description provided for @longerSujood.
  ///
  /// In en, this message translates to:
  /// **'Lengthening your prostration allows you to be closest to Allah, making it a powerful time for دعا and reflection.\n(Muslim 479)'**
  String get longerSujood;

  /// No description provided for @seekingRefugeBeforeRecitation.
  ///
  /// In en, this message translates to:
  /// **'Saying \'A‘udhu billahi min ash-shaytan ir-rajim\' protects your recitation and focus from distractions.\n(Abu Dawud 775)'**
  String get seekingRefugeBeforeRecitation;

  /// No description provided for @sayingAmeen.
  ///
  /// In en, this message translates to:
  /// **'Saying \'Ameen\' after Al-Fatihah aligns your supplication with the angels and brings acceptance of your prayer.\n(Bukhari 782; Muslim 410)'**
  String get sayingAmeen;

  /// No description provided for @fullDhikrAfterRuku.
  ///
  /// In en, this message translates to:
  /// **'Completing the full praise after rising from ruku fills your prayer with gratitude and proper remembrance.\n(Muslim 477)'**
  String get fullDhikrAfterRuku;

  /// No description provided for @enterWithRightFoot.
  ///
  /// In en, this message translates to:
  /// **'Entering the mosque with the right foot reflects respect and adherence to the Sunnah in sacred spaces.\n(Hakim 1/218)'**
  String get enterWithRightFoot;

  /// No description provided for @duaEnteringMosque.
  ///
  /// In en, this message translates to:
  /// **'Saying the prescribed dua when entering the mosque opens the doors of mercy and prepares your heart for worship.\n(Muslim 713)'**
  String get duaEnteringMosque;

  /// No description provided for @tahiyyatAlMasjid.
  ///
  /// In en, this message translates to:
  /// **'Praying two rak‘ah before sitting in the mosque honors the house of Allah and brings immediate reward.\n(Bukhari 444; Muslim 714)'**
  String get tahiyyatAlMasjid;

  /// No description provided for @walkingCalmlyToPrayer.
  ///
  /// In en, this message translates to:
  /// **'Walking to prayer with calmness and dignity reflects respect for the act of worship and increases your reward.\n(Bukhari 908; Muslim 602)'**
  String get walkingCalmlyToPrayer;

  /// No description provided for @usingSutrah.
  ///
  /// In en, this message translates to:
  /// **'Placing a barrier (sutrah) while praying protects your focus and follows the practice of the Prophet ﷺ.\n(Abu Dawud 689)'**
  String get usingSutrah;

  /// No description provided for @repeatingAfterMuadhin.
  ///
  /// In en, this message translates to:
  /// **'Repeating the words of the adhan connects you to the call of prayer and brings great reward.\n(Bukhari 611; Muslim 383)'**
  String get repeatingAfterMuadhin;

  /// No description provided for @sendingSalawatAfterAdhan.
  ///
  /// In en, this message translates to:
  /// **'Sending blessings upon the Prophet ﷺ after the adhan elevates your rank and brings you closer to him on the Day of Judgment.\n(Muslim 384)'**
  String get sendingSalawatAfterAdhan;

  /// No description provided for @duaAfterAdhan.
  ///
  /// In en, this message translates to:
  /// **'Saying the prescribed dua after the adhan is a means for your supplication to be accepted.\n(Bukhari 614)'**
  String get duaAfterAdhan;

  /// No description provided for @makingPersonalDuaAfterAdhan.
  ///
  /// In en, this message translates to:
  /// **'After the adhan is a special time when duas are accepted—use it to ask Allah for what your heart needs.\n(Abu Dawud 524)'**
  String get makingPersonalDuaAfterAdhan;

  /// No description provided for @sayingBismillahGeneral.
  ///
  /// In en, this message translates to:
  /// **'Saying \'Bismillah\' before actions fills them with blessing and turns everyday tasks into acts of worship.\n(Bukhari 5376)'**
  String get sayingBismillahGeneral;

  /// No description provided for @salamUponEntering.
  ///
  /// In en, this message translates to:
  /// **'Giving salam when entering a home spreads peace, brings blessings, and strengthens relationships.\n(Tirmidhi 2698)'**
  String get salamUponEntering;

  /// No description provided for @duaLeavingHome.
  ///
  /// In en, this message translates to:
  /// **'Saying the prescribed dua when leaving your home places your trust in Allah and brings protection throughout your journey.\n(Abu Dawud 5095; Tirmidhi 3426)'**
  String get duaLeavingHome;

  /// No description provided for @miswakWhenEnteringHome.
  ///
  /// In en, this message translates to:
  /// **'Using the miswak upon entering the home follows the Sunnah and maintains cleanliness and freshness.\n(Muslim 253)'**
  String get miswakWhenEnteringHome;

  /// No description provided for @wearingRightSideFirst.
  ///
  /// In en, this message translates to:
  /// **'Beginning with the right side when dressing reflects love for the Sunnah in even the smallest actions.\n(Bukhari 168)'**
  String get wearingRightSideFirst;

  /// No description provided for @duaWhenWearingClothes.
  ///
  /// In en, this message translates to:
  /// **'Saying the prescribed dua after wearing new clothes reminds you that all provisions come from Allah.\n(Abu Dawud 4020; Tirmidhi 1767)'**
  String get duaWhenWearingClothes;

  /// No description provided for @removingLeftSideFirst.
  ///
  /// In en, this message translates to:
  /// **'Removing clothing starting with the left side follows the balanced guidance of the Prophet ﷺ.\n(Abu Dawud 4141)'**
  String get removingLeftSideFirst;

  /// No description provided for @bismillahBeforeEating.
  ///
  /// In en, this message translates to:
  /// **'Saying \'Bismillah\' before eating invites blessings into your food and protects it from Shaytan.\n(Bukhari 5376; Muslim 2022)'**
  String get bismillahBeforeEating;

  /// No description provided for @eatingWithRightHand.
  ///
  /// In en, this message translates to:
  /// **'Eating with the right hand is from the manners of Islam and reflects obedience in daily life.\n(Muslim 2020)'**
  String get eatingWithRightHand;

  /// No description provided for @eatingWhatIsNear.
  ///
  /// In en, this message translates to:
  /// **'Eating from what is directly in front of you teaches discipline, respect, and good manners.\n(Bukhari 5376)'**
  String get eatingWhatIsNear;

  /// No description provided for @drinkingInThreeBreaths.
  ///
  /// In en, this message translates to:
  /// **'Drinking in three breaths is healthier and follows the Sunnah of the Prophet ﷺ.\n(Muslim 2028)'**
  String get drinkingInThreeBreaths;

  /// No description provided for @smiling.
  ///
  /// In en, this message translates to:
  /// **'A sincere smile is charity. It spreads happiness, softens hearts, and earns reward from Allah.\n(Tirmidhi 1956)'**
  String get smiling;

  /// No description provided for @givingSalam.
  ///
  /// In en, this message translates to:
  /// **'Spreading salam increases love between people and is a key to entering Jannah.\n(Muslim 54)'**
  String get givingSalam;

  /// No description provided for @goodIntention.
  ///
  /// In en, this message translates to:
  /// **'Actions are judged by intentions. With sincerity, even ordinary actions become acts of worship.\n(Bukhari 1; Muslim 1907)'**
  String get goodIntention;

  /// No description provided for @renewingIntention.
  ///
  /// In en, this message translates to:
  /// **'Renew your intention regularly so your daily actions remain connected to Allah and full of reward.\n(Bukhari 1; Muslim 1907)'**
  String get renewingIntention;

  /// No description provided for @turningHabitsIntoWorship.
  ///
  /// In en, this message translates to:
  /// **'Through sincere intention, even habits like eating, sleeping, and working can become acts of worship.\n(Bukhari 1)'**
  String get turningHabitsIntoWorship;

  /// No description provided for @rememberingAllahConstantly.
  ///
  /// In en, this message translates to:
  /// **'Keep your tongue moist with the remembrance of Allah, bringing peace to your heart and light to your life.\n(Tirmidhi 3375)'**
  String get rememberingAllahConstantly;

  /// No description provided for @gratitude.
  ///
  /// In en, this message translates to:
  /// **'Showing gratitude to Allah increases blessings and brings contentment to the heart.\n(Bukhari 1130)'**
  String get gratitude;

  /// No description provided for @reflectionOnBlessings.
  ///
  /// In en, this message translates to:
  /// **'Reflecting on Allah’s blessings deepens your appreciation and strengthens your faith.\n(Qur’an 14:7)'**
  String get reflectionOnBlessings;

  /// No description provided for @leavingSinsForQiyam.
  ///
  /// In en, this message translates to:
  /// **'Avoiding sins strengthens your heart and makes it easier to stand in night prayer.\n(Ibn Majah 4245)'**
  String get leavingSinsForQiyam;

  /// No description provided for @fightingNafs.
  ///
  /// In en, this message translates to:
  /// **'Striving against your النفس in obedience to Allah is one of the greatest forms of jihad.\n(Tirmidhi 1621)'**
  String get fightingNafs;

  /// No description provided for @avoidingInnovation.
  ///
  /// In en, this message translates to:
  /// **'Holding firmly to the Sunnah and avoiding innovation preserves the purity of your religion.\n(Muslim 867)'**
  String get avoidingInnovation;

  /// No description provided for @tafakkurOnCreation.
  ///
  /// In en, this message translates to:
  /// **'Reflecting on the creation of the heavens and earth strengthens faith and brings awe of Allah.\n(Qur’an 3:191)'**
  String get tafakkurOnCreation;

  /// No description provided for @monthlyQuranCompletion.
  ///
  /// In en, this message translates to:
  /// **'Completing the Qur’an regularly keeps your heart alive and connected to the words of Allah.\n(Abu Dawud 1394; Tirmidhi 2949)'**
  String get monthlyQuranCompletion;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fa',
    'ps',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'ps':
      return AppLocalizationsPs();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
