import 'package:flutter/material.dart';
import 'package:mohammad_in_24hrs/l10n/app_localizations.dart';
import 'package:mohammad_in_24hrs/main.dart';
import 'package:mohammad_in_24hrs/notification.dart';
import 'services/storage_service.dart';

class LibraryItem {
  final String title;
  final String description;

  LibraryItem({required this.title, required this.description});
}

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int selectedIndex = 0;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;
    final allItems = [
      // ================= TIME BASED =================
      LibraryItem(
        title: myLang.libraryWipingFace,
        description: myLang.wipingFaceAfterWaking,
      ),
      LibraryItem(
        title: myLang.libraryAlhamdulillahAfterWaking,
        description: myLang.sayingAlhamdulillahAfterWaking,
      ),
      LibraryItem(
        title: myLang.libraryUsingMiswak,
        description: myLang.usingMiswakAfterWaking,
      ),
      LibraryItem(
        title: myLang.libraryCleaningNoseThreeTimes,
        description: myLang.cleaningNoseThreeTimes,
      ),
      LibraryItem(
        title: myLang.libraryWashingHandsBeforeWater,
        description: myLang.washingHandsBeforeWater,
      ),

      LibraryItem(
        title: myLang.librarySunnahFajr,
        description: myLang.sunnahOfFajr,
      ),
      LibraryItem(
        title: myLang.librarySittingAfterFajrUntilSunrise,
        description: myLang.sittingAfterFajr,
      ),
      LibraryItem(
        title: myLang.libraryMorningAdhkar,
        description: myLang.morningAdhkar,
      ),
      LibraryItem(
        title: myLang.libraryDuhaPrayer,
        description: myLang.duhaPrayer,
      ),

      LibraryItem(
        title: myLang.libraryRawatibPrayers,
        description: myLang.rawatibDaily,
      ),
      LibraryItem(
        title: myLang.librarySunnahBeforeAsr,
        description: myLang.sunnahBeforeAsr,
      ),
      LibraryItem(
        title: myLang.librarySunnahBeforeMaghrib,
        description: myLang.sunnahBeforeMaghrib,
      ),
      LibraryItem(
        title: myLang.librarySunnahBeforeIsha,
        description: myLang.sunnahBeforeIsha,
      ),

      LibraryItem(
        title: myLang.libraryEveningAdhkar,
        description: myLang.eveningAdhkar,
      ),
      LibraryItem(
        title: myLang.librarySittingAfterMaghrib,
        description: myLang.sittingAfterMaghrib,
      ),

      LibraryItem(
        title: myLang.libraryQiyamAlLayl,
        description: myLang.qiyamAlLayl,
      ),
      LibraryItem(title: myLang.libraryWitr, description: myLang.witrPrayer),
      LibraryItem(
        title: myLang.libraryNightDuas,
        description: myLang.nightDuas,
      ),
      LibraryItem(
        title: myLang.librarySleepingOnRightSide,
        description: myLang.sleepingRightSide,
      ),
      LibraryItem(
        title: myLang.libraryDuasBeforeSleep,
        description: myLang.duasBeforeSleep,
      ),

      // ================= WORSHIP =================
      LibraryItem(
        title: myLang.librarySayingBismillahInWudu,
        description: myLang.bismillahWudu,
      ),
      LibraryItem(
        title: myLang.libraryWashingLimbsThreeTimes,
        description: myLang.washingLimbsThreeTimes,
      ),
      LibraryItem(
        title: myLang.libraryKhilalBetweenFingersToes,
        description: myLang.khilalFingersToes,
      ),
      LibraryItem(
        title: myLang.libraryMiswakDuringWudu,
        description: myLang.miswakDuringWudu,
      ),
      LibraryItem(
        title: myLang.libraryTwoRakahAfterWudu,
        description: myLang.twoRakahAfterWudu,
      ),

      LibraryItem(
        title: myLang.libraryRaisingHands,
        description: myLang.raisingHandsInPrayer,
      ),
      LibraryItem(
        title: myLang.libraryDuaAlIstiftah,
        description: myLang.duaIstiftah,
      ),
      LibraryItem(
        title: myLang.libraryExtraTasbeehInRukuSujood,
        description: myLang.extraTasbeehRukuSujood,
      ),
      LibraryItem(
        title: myLang.libraryDuaBetweenTwoSujood,
        description: myLang.duaBetweenTwoSujood,
      ),
      LibraryItem(
        title: myLang.libraryLongerSujood,
        description: myLang.longerSujood,
      ),

      LibraryItem(
        title: myLang.librarySeekingRefugeBeforeRecitation,
        description: myLang.seekingRefugeBeforeRecitation,
      ),
      LibraryItem(
        title: myLang.librarySayingAmeen,
        description: myLang.sayingAmeen,
      ),
      LibraryItem(
        title: myLang.libraryFullDhikrAfterRuku,
        description: myLang.fullDhikrAfterRuku,
      ),

      LibraryItem(
        title: myLang.libraryEnterWithRightFoot,
        description: myLang.enterWithRightFoot,
      ),
      LibraryItem(
        title: myLang.libraryDuaEnteringMosque,
        description: myLang.duaEnteringMosque,
      ),
      LibraryItem(
        title: myLang.libraryTahiyyatAlMasjid,
        description: myLang.tahiyyatAlMasjid,
      ),
      LibraryItem(
        title: myLang.libraryWalkingCalmly,
        description: myLang.walkingCalmlyToPrayer,
      ),
      LibraryItem(
        title: myLang.libraryUsingSutrah,
        description: myLang.usingSutrah,
      ),

      LibraryItem(
        title: myLang.libraryRepeatingAfterMuadhin,
        description: myLang.repeatingAfterMuadhin,
      ),
      LibraryItem(
        title: myLang.librarySendingSalawat,
        description: myLang.sendingSalawatAfterAdhan,
      ),
      LibraryItem(
        title: myLang.libraryDuaAfterAdhan,
        description: myLang.duaAfterAdhan,
      ),
      LibraryItem(
        title: myLang.libraryMakingPersonalDua,
        description: myLang.makingPersonalDuaAfterAdhan,
      ),

      // ================= SOCIAL =================
      LibraryItem(
        title: myLang.sayingBismillahGeneralTitle,
        description: myLang.sayingBismillahGeneral,
      ),
      LibraryItem(
        title: myLang.salamUponEnteringTitle,
        description: myLang.salamUponEntering,
      ),
      LibraryItem(
        title: myLang.duaLeavingHomeTitle,
        description: myLang.duaLeavingHome,
      ),
      LibraryItem(
        title: myLang.miswakWhenEnteringHomeTitle,
        description: myLang.miswakWhenEnteringHome,
      ),
      LibraryItem(
        title: myLang.wearingRightSideFirstTitle,
        description: myLang.wearingRightSideFirst,
      ),
      LibraryItem(
        title: myLang.duaWhenWearingClothesTitle,
        description: myLang.duaWhenWearingClothes,
      ),
      LibraryItem(
        title: myLang.removingLeftSideFirstTitle,
        description: myLang.removingLeftSideFirst,
      ),
      LibraryItem(
        title: myLang.bismillahBeforeEatingTitle,
        description: myLang.bismillahBeforeEating,
      ),
      LibraryItem(
        title: myLang.eatingWithRightHandTitle,
        description: myLang.eatingWithRightHand,
      ),
      LibraryItem(
        title: myLang.eatingWhatIsNearTitle,
        description: myLang.eatingWhatIsNear,
      ),
      LibraryItem(
        title: myLang.drinkingInThreeBreathsTitle,
        description: myLang.drinkingInThreeBreaths,
      ),
      LibraryItem(title: myLang.smilingTitle, description: myLang.smiling),
      LibraryItem(
        title: myLang.givingSalamTitle,
        description: myLang.givingSalam,
      ),
      LibraryItem(
        title: myLang.goodIntentionTitle,
        description: myLang.goodIntention,
      ),

      // ================= SPIRITUAL =================
      LibraryItem(
        title: myLang.renewingIntentionTitle,
        description: myLang.renewingIntention,
      ),
      LibraryItem(
        title: myLang.turningHabitsIntoWorshipTitle,
        description: myLang.turningHabitsIntoWorship,
      ),
      LibraryItem(
        title: myLang.rememberingAllahConstantlyTitle,
        description: myLang.rememberingAllahConstantly,
      ),
      LibraryItem(title: myLang.gratitudeTitle, description: myLang.gratitude),
      LibraryItem(
        title: myLang.reflectionOnBlessingsTitle,
        description: myLang.reflectionOnBlessings,
      ),
      LibraryItem(
        title: myLang.leavingSinsForQiyamTitle,
        description: myLang.leavingSinsForQiyam,
      ),
      LibraryItem(
        title: myLang.fightingNafsTitle,
        description: myLang.fightingNafs,
      ),
      LibraryItem(
        title: myLang.avoidingInnovationTitle,
        description: myLang.avoidingInnovation,
      ),
      LibraryItem(
        title: myLang.tafakkurOnCreationTitle,
        description: myLang.tafakkurOnCreation,
      ),
      LibraryItem(
        title: myLang.monthlyQuranCompletionTitle,
        description: myLang.monthlyQuranCompletion,
      ),
    ];
    final searchResults = searchQuery.isEmpty
        ? []
        : allItems
              .where(
                (item) => item.title.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
              )
              .toList();

    final tabs = [
      _TabItem(Icons.schedule, myLang.timeBased),
      _TabItem(Icons.mosque, myLang.worshipSunnahs),
      _TabItem(Icons.people_alt_outlined, myLang.socialSunnahs),
      _TabItem(Icons.spa_sharp, myLang.spritualSunnahs),
    ];

    return Scaffold(
      appBar: AppBar(
        animateColor: true,
        centerTitle: true,
        title: Text(
          myLang.libraryAppBarTitle,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(170),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                SearchBar(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  textStyle: .all(TextStyle(color: primaryWhite)),
                  hintStyle: .all(TextStyle(color: primaryWhite)),
                  hintText: 'Search...',
                  padding: .all(EdgeInsets.symmetric(horizontal: 15)),
                  backgroundColor: .all(greenColor),
                  leading: Icon(Icons.search, size: 30, color: primaryWhite),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(tabs.length, (index) {
                      final isSelected = selectedIndex == index;

                      return TextButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: isSelected
                              ? Colors.green.shade100
                              : Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              tabs[index].icon,
                              size: 28,
                              color: isSelected ? Colors.green : Colors.black,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              tabs[index].title,
                              style: TextStyle(
                                color: isSelected ? Colors.green : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),

      body: searchQuery.isNotEmpty
          ? ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final item = searchResults[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(item.title),
                    trailing: const Icon(Icons.navigate_next_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DiscreptionPage(
                            title: item.title,
                            discreption: item.description,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : IndexedStack(
              index: selectedIndex,
              children: const [
                TimeBasedPage(),
                WorshipPage(),
                SocialPage(),
                SpiritualPage(),
              ],
            ),
    );
  }
}

class _TabItem {
  final IconData icon;
  final String title;

  _TabItem(this.icon, this.title);
}

class TimeBasedPage extends StatelessWidget {
  const TimeBasedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;
    final timeBasedList = [
      myLang.libraryWipingFace,
      myLang.libraryAlhamdulillahAfterWaking,
      myLang.libraryUsingMiswak,
      myLang.libraryCleaningNoseThreeTimes,
      myLang.libraryWashingHandsBeforeWater,

      myLang.librarySunnahFajr,
      myLang.librarySittingAfterFajrUntilSunrise,
      myLang.libraryMorningAdhkar,
      myLang.libraryDuhaPrayer,

      myLang.libraryRawatibPrayers,
      myLang.librarySunnahBeforeAsr,
      myLang.librarySunnahBeforeMaghrib,
      myLang.librarySunnahBeforeIsha,

      myLang.libraryEveningAdhkar,
      myLang.librarySittingAfterMaghrib,

      myLang.libraryQiyamAlLayl,
      myLang.libraryWitr,
      myLang.libraryNightDuas,
      myLang.librarySleepingOnRightSide,
      myLang.libraryDuasBeforeSleep,
    ];
    final discreptionList = [
      myLang.wipingFaceAfterWaking,
      myLang.sayingAlhamdulillahAfterWaking,
      myLang.usingMiswakAfterWaking,
      myLang.cleaningNoseThreeTimes,
      myLang.washingHandsBeforeWater,
      myLang.sunnahOfFajr,
      myLang.sittingAfterFajr,
      myLang.morningAdhkar,
      myLang.duhaPrayer,
      myLang.rawatibDaily,
      myLang.sunnahBeforeAsr,
      myLang.sunnahBeforeMaghrib,
      myLang.sunnahBeforeIsha,
      myLang.eveningAdhkar,
      myLang.sittingAfterMaghrib,
      myLang.qiyamAlLayl,
      myLang.witrPrayer,
      myLang.nightDuas,
      myLang.sleepingRightSide,
      myLang.duasBeforeSleep,
    ];

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: timeBasedList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: .symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: secondryWhite,
            borderRadius: BorderRadius.all(.circular(10)),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DiscreptionPage(
                    title: timeBasedList[index],
                    discreption: discreptionList[index],
                  ),
                ),
              );
            },
            title: Text(timeBasedList[index]),
            trailing: Icon(Icons.navigate_next_rounded),
          ),
        );
      },
    );
  }
}

class DiscreptionPage extends StatefulWidget {
  const DiscreptionPage({
    super.key,
    required this.title,
    required this.discreption,
  });
  final String? title;
  final String? discreption;

  @override
  State<DiscreptionPage> createState() => _DiscreptionPageState();
}

class _DiscreptionPageState extends State<DiscreptionPage> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButton: ElevatedButton.icon(
        onPressed: () async {
        showAdaptiveDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              title: Text(myLang.alertBoxTitle),
              content: Text(myLang.alertBoxContent),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => NotificationMainWidget(),
                      ),
                      ModalRoute.withName('/')
                    );
                  },
                  child: Text(myLang.alertBoxActionGoToSelected),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(myLang.alertBoxActionDone, style: TextStyle(color: Colors.green),),
                ),
              ],
            ),
          );
          await SharedPreferencesHelper.saveSunnah(
            widget.title.toString(),
            widget.discreption.toString(),
          );
        },

        label: Text(myLang.addBookmark),
        icon: Icon(Icons.bookmark_add_rounded),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(greenColor),
          foregroundColor: WidgetStatePropertyAll(Colors.black),
          iconSize: WidgetStatePropertyAll(25),
        ),
      ),
      bottomNavigationBar: Image.asset(
        'assets/images/design_mosque.webp',
        scale: 1,
      ),
      appBar: AppBar(
        foregroundColor: primaryWhite,
        backgroundColor: goldenColor,
        centerTitle: true,
        title: Text(widget.title.toString()),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.3 * deviceHeight,
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              Container(
                padding: .all(30),
                child: Column(
                  spacing: 60,
                  children: [
                    Text(
                      widget.discreption.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorshipPage extends StatelessWidget {
  const WorshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;

    final worshipList = [
      myLang.librarySayingBismillahInWudu,
      myLang.libraryWashingLimbsThreeTimes,
      myLang.libraryKhilalBetweenFingersToes,
      myLang.libraryMiswakDuringWudu,
      myLang.libraryTwoRakahAfterWudu,

      myLang.libraryRaisingHands,
      myLang.libraryDuaAlIstiftah,
      myLang.libraryExtraTasbeehInRukuSujood,
      myLang.libraryDuaBetweenTwoSujood,
      myLang.libraryLongerSujood,

      myLang.librarySeekingRefugeBeforeRecitation,
      myLang.librarySayingAmeen,
      myLang.libraryFullDhikrAfterRuku,

      myLang.libraryEnterWithRightFoot,
      myLang.libraryDuaEnteringMosque,
      myLang.libraryTahiyyatAlMasjid,
      myLang.libraryWalkingCalmly,
      myLang.libraryUsingSutrah,

      myLang.libraryRepeatingAfterMuadhin,
      myLang.librarySendingSalawat,
      myLang.libraryDuaAfterAdhan,
      myLang.libraryMakingPersonalDua,
    ];

    final worshipDetailedList = [
      myLang.bismillahWudu,
      myLang.washingLimbsThreeTimes,
      myLang.khilalFingersToes,
      myLang.miswakDuringWudu,
      myLang.twoRakahAfterWudu,
      myLang.raisingHandsInPrayer,
      myLang.duaIstiftah,
      myLang.extraTasbeehRukuSujood,
      myLang.duaBetweenTwoSujood,
      myLang.longerSujood,
      myLang.seekingRefugeBeforeRecitation,
      myLang.sayingAmeen,
      myLang.fullDhikrAfterRuku,
      myLang.enterWithRightFoot,
      myLang.duaEnteringMosque,
      myLang.tahiyyatAlMasjid,
      myLang.walkingCalmlyToPrayer,
      myLang.usingSutrah,
      myLang.repeatingAfterMuadhin,
      myLang.sendingSalawatAfterAdhan,
      myLang.duaAfterAdhan,
      myLang.makingPersonalDuaAfterAdhan,
    ];
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: worshipList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: .symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: secondryWhite,
            borderRadius: BorderRadius.all(.circular(10)),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DiscreptionPage(
                      title: worshipList[index],
                      discreption: worshipDetailedList[index],
                    );
                  },
                ),
              );
            },
            title: Text(worshipList[index]),
            trailing: Icon(Icons.navigate_next_rounded),
          ),
        );
      },
    );
  }
}

var list = ['g', 'b', 'c'];

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;

    final dailyLifeTitles = [
      myLang.sayingBismillahGeneralTitle,
      myLang.salamUponEnteringTitle,
      myLang.duaLeavingHomeTitle,
      myLang.miswakWhenEnteringHomeTitle,
      myLang.wearingRightSideFirstTitle,
      myLang.duaWhenWearingClothesTitle,
      myLang.removingLeftSideFirstTitle,
      myLang.bismillahBeforeEatingTitle,
      myLang.eatingWithRightHandTitle,
      myLang.eatingWhatIsNearTitle,
      myLang.drinkingInThreeBreathsTitle,
      myLang.smilingTitle,
      myLang.givingSalamTitle,
      myLang.goodIntentionTitle,
    ];

    final dailyLifeDetailed = [

      myLang.sayingBismillahGeneral,
      myLang.salamUponEntering,
      myLang.duaLeavingHome,
      myLang.miswakWhenEnteringHome,
      myLang.wearingRightSideFirst,
      myLang.duaWhenWearingClothes,
      myLang.removingLeftSideFirst,
      myLang.bismillahBeforeEating,
      myLang.eatingWithRightHand,
      myLang.eatingWhatIsNear,
      myLang.drinkingInThreeBreaths,
      myLang.smiling,
      myLang.givingSalam,
      myLang.goodIntention,

    ];
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: dailyLifeTitles.length,
      itemBuilder: (context, index) {
        return Container(
          margin: .symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: secondryWhite,
            borderRadius: BorderRadius.all(.circular(10)),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DiscreptionPage(
                      title: dailyLifeTitles[index],
                      discreption: dailyLifeDetailed[index],
                    );
                  },
                ),
              );
            },
            title: Text(dailyLifeTitles[index]),
            trailing: Icon(Icons.navigate_next_rounded),
          ),
        );
      },
    );
  }
}

class SpiritualPage extends StatelessWidget {
  const SpiritualPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;

    final spiritualTitles = [
      myLang.renewingIntentionTitle,
      myLang.turningHabitsIntoWorshipTitle,
      myLang.rememberingAllahConstantlyTitle,
      myLang.gratitudeTitle,
      myLang.reflectionOnBlessingsTitle,
      myLang.leavingSinsForQiyamTitle,
      myLang.fightingNafsTitle,
      myLang.avoidingInnovationTitle,
      myLang.tafakkurOnCreationTitle,
      myLang.monthlyQuranCompletionTitle,
    ];

    final spiritualSunnahs = [
      myLang.renewingIntention,
      myLang.turningHabitsIntoWorship,
      myLang.rememberingAllahConstantly,
      myLang.gratitude,
      myLang.reflectionOnBlessings,
      myLang.leavingSinsForQiyam,
      myLang.fightingNafs,
      myLang.avoidingInnovation,
      myLang.tafakkurOnCreation,
      myLang.monthlyQuranCompletion,
    ];

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: spiritualTitles.length,
      itemBuilder: (context, index) {
        return Container(
          margin: .symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: secondryWhite,
            borderRadius: BorderRadius.all(.circular(10)),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DiscreptionPage(
                      title: spiritualTitles[index],
                      discreption: spiritualSunnahs[index],
                    );
                  },
                ),
              );
            },
            title: Text(spiritualTitles[index]),
            trailing: Icon(Icons.navigate_next_rounded),
          ),
        );
      },
    );
  }
}
