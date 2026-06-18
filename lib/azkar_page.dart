import 'package:flutter/material.dart';
import 'package:mohammad_in_24hrs/l10n/app_localizations.dart';
import 'package:mohammad_in_24hrs/main.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ZikrPage extends StatefulWidget {
  const ZikrPage({super.key});

  @override
  State<ZikrPage> createState() => _ZikrPageState();
}

class _ZikrPageState extends State<ZikrPage> {

  final PageController _pageController = PageController();
  
  void _increament(){
    setState(() {
              if (count < target) {
                count++;
              }
            });
  }

  int currentProgress = 0;
  int count = 0;
  int target = 1;

@override
  void initState() {
    target = hourNow >= 20 && hourNow < 23 
    ? 33 
    : 1;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    final myLang = AppLocalizations.of(context)!;

 ZikrItem varZikr1 = ZikrItem(
      zikr:
          'اَللّٰهُمَّ مَا أَصْبَحَ بِيْ مِنْ نِّعْمَةٍ أَوْ بِأَحَدٍ مِّنْ خَلْقِكَ ، فَمِنْكَ وَحْدَكَ لَا شَرِيْكَ لَكَ ، فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ.',
      target: 1,
      tran:
          'Allāhumma mā aṣbaḥa bī min niʿmatin aw bi-aḥadim-min khalqik, fa-minka waḥdaka lā sharīka lak, fa laka-l-ḥamdu wa laka-sh-shukr.',
    );
 ZikrItem varZikr2 = ZikrItem(
      zikr:
          'أَصْبَحْنَا عَلَىٰ فِطْرَةِ الْإِسْلَامِ ، وَعَلَىٰ كَلِمَةِ الْإِخْلَاصِ ، وَعَلَىٰ دِيْنِ نَبِيِّنَا مُحَمَّدٍ ، وَعَلَىٰ مِلَّةِ أَبِيْنَا إِبْرَاهِيْمَ حَنِيْفًا مُّسْلِمًا وَّمَا كَانَ مِنَ الْمُشْرِكِيْنَ.',
      target: 1,
      tran:
          'Aṣbaḥnā ʿalā fiṭrati-l-islām. wa ʿalā kalimati-l-ikhlāṣ, wa ʿalā dīni Nabiyyinā Muḥammadin ṣallallāhu ʿalayhi wa sallam, wa ʿalā millati abīnā Ibrāhīma ḥanīfam-muslima, wa mā kāna min-l-mushrikīn.',
    );
 ZikrItem varZikr3 = ZikrItem(
      zikr:
          'أَصْبَحْتُ أُثْنِيْ عَلَيْكَ حَمْدًا ، وَأَشْهَدُ أَنْ لَّا إِلٰهَ إِلَّا اللّٰهُ.',
      target: 1,
      tran:
          'Aṣbaḥtu uthnī ʿalayka ḥamdā, wa ash-hadu al-lā ilāha illāl- Allāh.',
    );
 ZikrItem varZikr4 =  ZikrItem(
      zikr:
          'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلّٰهِ وَالْحَمْدُ لِلّٰهِ ، لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيْرٌ ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِيْ هٰذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ ، وَأَعُوْذُ بِكَ مِنْ شَرِّ مَا فِيْ هٰذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ ، رَبِّ أَعُوْذُ بِكَ مِنَ الْكَسَلِ وَسُوْءِ الْكِبَرِ ، رَبِّ أَعُوْذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ.',
      target: 1,
      tran:
          'Aṣbaḥnā wa aṣbaḥa-l-mulku li-llāh, wa-l-ḥamdu li-llāh, lā ilāha illa-llāhu waḥdahū lā sharīka lah, lahu-l-mulku wa lahu-l-ḥamd, wa huwa ʿalā kulli shay’in Qadīr, Rabbi as’aluka khayra mā fī hādha-l-yawmi wa khayra mā baʿdah, wa aʿūdhu bika min sharri mā fī hādha-l-yawmi wa sharri mā baʿdah. Rabbi aʿūdhu bika mina-l-kasali wa sū’i-l-kibar, Rabbi aʿūdhu bika min ʿadhābin fi-n-nāri wa ʿadhābin fi-l-qabr.',
    );
 ZikrItem varZikr5 = ZikrItem(
      zikr:
          'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلّٰهِ رَبِّ الْعَالَمِيْنَ ، اَللّٰهُمَّ إِنِّيْ أَسْأَلُكَ خَيْرَ هٰذَا الْيَوْمِ ، فَتْحَهُ وَنَصْرَهُ وَنُوْرَهُ وَبَرَكَتَهُ وَهُدَاهُ ، وَأَعُوْذُ بِكَ مِنْ شَرِّ مَا فِيْهِ وَشَرِّ مَا بَعْدَهُ.',
      target: 1,
      tran:
          'Aṣbaḥnā wa aṣbaḥa-l-mulku li-llāhi Rabbi-l-ʿālamīn, Allāhumma innī as’aluka khayra hādha-l-yawm, fatḥahū wa naṣrahū wa nūrahū wa barakatahū wa hudāh, wa aʿūdhu bika min sharri mā fīhi wa sharri mā baʿdah.',
    );
ZikrItem varZikr6 =  ZikrItem(
      zikr:
          'اَللّٰهُمَّ إِنِّيْ أَصْبَحْتُ أُشْهِدُكَ ، وَأُشْهِدُ حَمَلَةَ عَرْشِكَ وَمَلَائِكَتَكَ وَجَمِيْعَ خَلْقِكَ ، أَنَّكَ أَنْتَ اللّٰهُ لَا إِلٰهَ إِلَّا أَنْتَ وَحْدَكَ لَا شَرِيْكَ لَكَ ، وَأَنَّ مُحَمَّدًا عَبْدُكَ وَرَسُوْلُكَ.',
      target: 4,
      tran:
          'Allāhumma innī aṣbaḥtu ush-hiduk, wa ush-hidu ḥamlata ʿarshik, wa malā’ikatika wa jamīʿa khalqik, an-naka Anta-llāhu lā ilāha illā Anta waḥdak, lā sharīka lak, wa anna Muḥammadan ʿabduka wa rasūluk.',
    );
 ZikrItem varZikr7 = ZikrItem(
      zikr:
          'اَللّٰهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوْتُ وَإِلَيْكَ النُّشُوْرُ.',
      target: 1,
      tran:
          'Allāhumma bika aṣbaḥnā wa bika amsaynā wa bika naḥyā wa bika namūtu wa ilayka-n-nushūr.',
    );
    ZikrItem varZikr8 = ZikrItem(
      zikr:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا.',
      target: 1,
      tran:
          'Allahumma inni as’aluka ‘ilman nāfi‘an, wa rizqan ṭayyiban, wa ‘amalan mutaqabbalan.',
    );
if (hourNow >= 15 && hourNow < 20) {
  setState(() {
    varZikr1 = ZikrItem(zikr: 'اَللّٰهُمَّ مَا أَمْسَىٰ بِيْ مِنْ نِّعْمَةٍ أَوْ بِأَحَدٍ مِّنْ خَلْقِكَ ، فَمِنْكَ وَحْدَكَ لَا شَرِيْكَ لَكَ ، فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ.', target: 1, tran: 'Allāhumma mā amsā bī min niʿmatin aw bi-aḥadin min khalqik, fa-minka waḥdaka lā sharīka lak, fa laka-l-ḥamdu wa laka-sh-shukr.');
    varZikr2 = ZikrItem(zikr: 'أَمْسَيْنَا عَلَىٰ فِطْرَةِ الْإِسْلَامِ ، وَعَلَىٰ كَلِمَةِ الْإِخْلَاصِ ، وَعَلَىٰ دِيْنِ نَبِيِّنَا مُحَمَّدٍ ، وَعَلَىٰ مِلَّةِ أَبِيْنَا إِبْرَاهِيْمَ حَنِيْفًا مُّسْلِمًا وَّمَا كَانَ مِنَ الْمُشْرِكِيْنَ.', target: 1, tran: 'Amsaynā ʿalā fiṭrati-l-islām, wa ʿalā kalimati-l-ikhlāṣ, wa ʿalā dīni Nabiyyinā Muḥammadin ṣallallāhu ʿalayhi wa sallam, wa ʿalā millati abīnā Ibrāhīma ḥanīfam-muslima, wa mā kāna mina-l-mushrikīn.');
    varZikr3 = ZikrItem(zikr: 'أَمْسَيْتُ أُثْنِيْ عَلَيْكَ حَمْدًا ، وَأَشْهَدُ أَنْ لَّا إِلٰهَ إِلَّا اللّٰهُ.', target: 1, tran: 'Amsaytu uthnī ʿalayka ḥamdā, wa ash-hadu al-lā ilāha illāl-llāh.');
    varZikr4 = ZikrItem(zikr: 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلّٰهِ وَالْحَمْدُ لِلّٰهِ ، لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيْرٌ ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِيْ هٰذِهِ اللَّيْلَةِ وَخَيْرَ مَا بَعْدَهَا ، وَأَعُوْذُ بِكَ مِنْ شَرِّ مَا فِيْ هٰذِهِ اللَّيْلَةِ وَشَرِّ مَا بَعْدَهَا ، رَبِّ أَعُوْذُ بِكَ مِنَ الْكَسَلِ وَسُوْءِ الْكِبَرِ ، رَبِّ أَعُوْذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ.', target: 1, tran: 'Amsaynā wa amsa-l-mulku li-llāh, wa-l-ḥamdu li-llāh, lā ilāha illa-llāhu waḥdahū lā sharīka lah, lahu-l-mulku wa lahu-l-ḥamd, wa huwa ʿalā kulli shay’in Qadīr, Rabbi as’aluka khayra mā fī hādhihi-l-laylati wa khayra mā baʿdah, wa aʿūdhu bika min sharri mā fī hādhihi-l-laylati wa sharri mā baʿdah. Rabbi aʿūdhu bika mina-l-kasali wa sū’i-l-kibar, Rabbi aʿūdhu bika min ʿadhābin fi-n-nāri wa ʿadhābin fi-l-qabr.');
    varZikr5 = ZikrItem(zikr: 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلّٰهِ رَبِّ الْعَالَمِيْنَ ، اَللّٰهُمَّ إِنِّيْ أَسْأَلُكَ خَيْرَ هـٰذِهِ اللَّيْلَةِ ، فَتْحَهَا وَنَصْرَهَا وَنُوْرَهَا وَبَرَكَتَهَا وَهُدَاهَا ، وَأَعُوْذُ بِكَ مِنْ شَرِّ مَا فِيْهَا وَشَرِّ مَا بَعْدَهَا.', target: 1, tran: 'Amsaynā wa amsa-l-mulku li-llāhi Rabbi-l-ʿālamīn, Allāhumma innī as’aluka khayra hādhihi-l-laylah, fatḥahā wa naṣrahā wa nūrahā wa barakatahā wa hudāhā, wa aʿūdhu bika min sharri mā fīhā wa sharri mā baʿdahā.');
    varZikr6 = ZikrItem(zikr: 'اَللّٰهُمَّ إِنِّيْ أَمْسَيْتُ أُشْهِدُكَ وَأُشْهِدُ حَمَلَةَ عَرْشِكَ وَمَلَائِكَتَكَ وَجَمِيْعَ خَلْقِكَ ، أَنَّكَ أَنْتَ اللّٰهُ لَا إِلٰهَ إِلَّا أَنْتَ وَحْدَكَ لَا شَرِيْكَ لَكَ ، وَأَنَّ مُحَمَّدًا عَبْدُكَ وَرَسُوْلُكَ.', target: 4, tran: 'Allāhumma innī amsaytu ush-hiduka, wa ush-hidu ḥamlata ʿarshika, wa malā’ikatika, wa jamī’a khalqika, annaka Anta-llāhu lā ilāha illā Anta waḥdak, lā sharīka lak, wa an-na Muḥammadan ʿabduka wa rasūluk.');
    varZikr7 = ZikrItem(zikr: 'اَللّٰهُمَّ بِكَ أَمْسَيْنَا وَبِكَ أَصْبَحْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوْتُ وَإِلَيْكَ الْمَصِيْرُ.', target: 1, tran: 'Allāhumma bika amsaynā wa bika aṣbaḥnā wa bika naḥyā wa bika namūtu wa ilayka-l-maṣīr.');
    varZikr8 = ZikrItem(zikr: 'أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّةِ مِنْ شَرِّ مَا خَلَقَ', target: 1, tran: 'A‘ūdhu bikalimāti-llāhi t-tāmmati min sharri mā khalaq.');
  });
}


 List<ZikrItem> azkar = [
    ZikrItem(
      zikr:
          "أَعُوْذُ بِاللّٰهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ. اَللّٰهُ لَآ إِلٰهَ إِلَّا هُوَ الْحَىُّ الْقَيُّوْمُ ، لَا تَأْخُذُهُۥ سِنَةٌ وَّلَا نَوْمٌ ، لَهُ مَا فِى السَّمٰـوٰتِ وَمَا فِى الْأَرْضِ ، مَنْ ذَا الَّذِىْ يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِۦ ، يَعْلَمُ مَا بَيْنَ أَيْدِيْهِمْ وَمَا خَلْفَهُمْ ، وَلَا يُحِيْطُوْنَ بِشَىْءٍ مِّنْ عِلْمِهِٓ إِلَّا بِمَا شَآءَ ، وَسِعَ كُرْسِيُّهُ السَّمٰـوٰتِ وَالْأَرْضَ، وَلَا يَئُوْدُهُۥ حِفْظُهُمَا ، وَهُوَ الْعَلِىُّ الْعَظِيْمُ.",
      target: 1,
      tran:
          'Aʿūdhu bi-llāhi mina-sh-Shayṭāni-r-rajīm. Allāhu lā ilāha illā Huwa-l-Ḥayyu-l-Qayyūm, lā ta’khudhuhū sinatuw-wa lā nawm, lahū mā fi-s-samāwāti wa mā fi-l-arḍ, man dhā’lladhī yashfaʿu ʿindahū illā bi-idhnih, yaʿlamu mā bayna aydīhim wa mā khalfahum, wa lā yuḥīṭūna bi-shay’im-min ʿilmihī illā bi-mā shā’, wasiʿa kursiyyuhu-s-samāwāti wa-l-arḍ, wa lā ya’ūduhū ḥifẓuhumā wa Huwa-l-ʿAlliyu-l-ʿAẓīm.',
    ),
    ZikrItem(
      zikr:
          "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ. قُلْ هُوَ اللّٰهُ أَحَدٌ ، اَللّٰهُ الصَّمَدُ ، لَمْ يَلِدْ وَلَمْ يُوْلَدْ ، وَلَمْ يَكُنْ لَّهُ كُفُوًا أَحَدٌ.",
      target: 3,
      tran:
          'Bismi-llāhi-r-Raḥmāni-r-Raḥīm. Qul Huwa-llāhu Aḥad. Allāhu-ṣ-Ṣamad. Lam yalid wa lam yūlad. Wa lam yakul-lahū kufuwan aḥad.',
    ),
    ZikrItem(
      zikr:
          "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ. قُلْ أَعُوْذُ بِرَبِّ الْفَلَقِ ، مِنْ شَرِّ مَا خَلَقَ ، وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ ، وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ ، وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ.",
      target: 3,
      tran:
          ' Bismi-llāhi-r-Raḥmāni-r-Raḥīm. Qul aʿūdhu bi-Rabbi-l-falaq. Min sharri mā khalaq. Wa min sharri ghāsiqin idhā waqab. Wa min sharri-n-naffāthāti fi-l-ʿuqad. Wa min sharri ḥāsidin idhā ḥasad. ',
    ),
    ZikrItem(
      zikr:
          "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ. قُلْ أَعُوْذُ بِرَبِّ النَّاسِ ، مَلِكِ النَّاسِ ، إِلٰهِ النَّاسِ ، مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ، اَلَّذِيْ يُوَسْوِسُ فِيْ صُدُوْرِ النَّاسِ ، مِنَ الْجِنَّةِ وَالنَّاسِ.",
      target: 3,
      tran:
          'Bismi-llāhi-r-Raḥmāni-r-Raḥīm. Qul aʿūdhu bi-Rabbi-n-nās. Maliki-n-nās. Ilāh-hin-nās. Min sharri-l-waswāsi-l-khannās. Al-ladhī yuwaswisu fī ṣudūri-n-nās. Mina-l-jinnati wa-n-nās.',
    ),
    ZikrItem(
      zikr:
          "اَللّٰهُمَّ أَنْتَ رَبِّيْ لَا إِلٰهَ إِلَّا أَنْتَ ، خَلَقْتَنِيْ وَأَنَا عَبْدُكَ ، وَأَنَا عَلَىٰ عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ ، أَعُوْذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ ، أَبُوْءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوْءُ لَكَ بِذَنْبِيْ ، فَاغْفِرْ لِيْ فَإِنَّهُ لَا يَغْفِرُ الذُّنُوْبَ إِلَّا أَنْتَ.",
      target: 1,
      tran:
          'Allāhumma Anta Rabbī, lā ilāha illā Ant, khalaqtanī wa ana ʿabduk, wa ana ʿalā ʿahdika wa waʿdika mā’staṭaʿt, aʿūdhu bika min sharri mā ṣanaʿt, abū’u laka bi niʿmatika ʿalayya wa abū’u laka bi-dhambī fa-ghfir lī fa-innahū lā yaghfiru-dh-dhunūba illā Ant.',
    ),
    ZikrItem(
      zikr:
          'اَللّٰهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ ، وَأَعُوْذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ، وَأَعُوْذُ بِكَ مِنَ الْجُبْنِ وَالْبُخْلِ ، وَأَعُوْذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ وَقَهْرِ الرِّجَالِ.',
      target: 1,
      tran:
          'Allāhumma innī aʿūdhu bika min-l-hammi wa-l-ḥazan, wa aʿūdhu bika min-l-ʿajzi wa-l-kasal, wa aʿūdhu bika min-l-jubni wa-l-bukhl, wa aʿūdhu bika min ghalabati-d-dayni wa qahri-r-rijāl.',
    ),
    ZikrItem(
      zikr:
          'اَللّٰهُمَّ إِنِّيْ أَسْأَلُكَ الْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ ، اَللّٰهُمَّ إِنِّيْ أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِيْ دِيْنِيْ وَدُنْيَايَ وَأَهْلِيْ وَمَالِيْ ، اَللّٰهُمَّ اسْتُرْ عَوْرَاتِيْ وَآمِنْ رَوْعَاتِيْ ، اَللّٰهُمَّ احْفَظْنِيْ مِنْ بَيْنِ يَدَيَّ ، وَمِنْ خَلْفِيْ ، وَعَنْ يَّمِيْنِيْ ، وَعَنْ شِمَالِيْ ، وَمِنْ فَوْقِيْ ، وَأَعُوْذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِيْ.',
      target: 1,
      tran:
          'Allāhumma innī as’aluka-l-ʿāfiyata fi-d-dunyā wa-l-ākhirah. Allāhumma innī as’aluka-l-ʿafwa wa-l-ʿāfiyata fī dīnī wa dunyāya wa ahlī wa mālī, Allāhumma-stur ʿawrātī wa āmin rawʿātī. Allāhumma-ḥfaẓnī mim bayni yadayya wa min khalfī, wa ʿay-n yamīnī wa ʿan shimālī wa min fawqī, wa aʿūdhu bi-ʿaẓamatika an ughtāla min taḥtī.',
    ),
    ZikrItem(
      zikr:
          'اَللّٰهُمَّ عَالِمَ الْغَيْبِ وَالشَّهَادَةِ ، فَاطِرَ السَّمٰوَاتِ وَالْأَرْضِ ، رَبَّ كُلِّ شَيْءٍ وَمَلِيْكَهُ ، أَشْهَدُ أَنْ لَّا إِلٰهَ إِلَّا أَنْتَ ، أَعُوْذُ بِكَ مِنْ شَرِّ نَفْسِيْ ، وَمِنْ شَرِّ الشَّيْطَانِ وَشِرْكِهِ ، وَأَنْ أَقْتَرِفَ عَلَىٰ نَفْسِيْ سُوْءًا ، أَوْ أَجُرَّهُ إِلَىٰ مُسْلِمٍ.',
      target: 1,
      tran: 'Allāhumma ʿālima-l-ghaybi wa-sh-shahādah, fāṭir-as-samāwāti wa-l-arḍi, rabba kulli shay’iw-wa malīkah, ash-hadu al-lā ilāha illā Anta, aʿūdhu bika min sharri nafsī wa min sharri-sh-shayṭāni wa shirkihī wa an aqtarifa ʿalā nafsī sū’an aw ajurrahū ilā muslim.',
    ),
    ZikrItem(
      zikr:
          'يَا حَيُّ يَا قَيُّوْمُ ، بِرَحْمَتِكَ أَسْتَغِيْثُ ، أَصْلِحْ لِيْ شَأْنِيْ كُلَّهُ ، وَلَا تَكِلْنِيْ إِلَىٰ نَفْسِيْ طَرْفَةَ عَيْنٍ.',
      target: 1,
      tran:
          'Yā Ḥayyu yā Qayyūm, bi-raḥmatika astaghīth, aṣliḥ lī sha’nī kullah, wa lā takilnī ilā nafsī ṭarfata ʿayn.',
    ),
    varZikr1,
    varZikr2,
    varZikr3,
   varZikr4,
    varZikr5,
   varZikr6,
    varZikr7,
    varZikr8,
    ZikrItem(
      zikr:
          'اَللّٰهُمَّ عَافِنِيْ فِيْ بَدَنِيْ ، اَللّٰهُمَّ عَافِنِيْ فِيْ سَمْعِيْ ، اَللّٰهُمَّ عَافِنِيْ فِيْ بَصَرِيْ ، لَا إِلٰهَ إِلَّا أَنْتَ ، اَللّٰهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنَ الْكُفْرِ وَالْفَقْرِ، وأَعُوْذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، لَا إِلٰهَ إِلَّا أَنْتَ.',
      target: 3,
      tran:
          'Allāhumma ʿāfinī fī badanī, Allāhumma ʿāfinī fī samʿī, Allāhumma ʿāfinī fī baṣarī, lā ilāha illā Ant, Allāhumma innī aʿūdhu bika mina-l-kufri wa-l-faqr, wa aʿūdhu bika min ʿadhābi-l-qabr, lā ilāha illā Ant.',
    ),
    ZikrItem(zikr: 'حَسْبِيَ اللّٰهُ لَا إِلٰهَ إِلَّا هُوَ ، عَلَيْهِ تَوَكَّلْتُ ، وَهُوَ رَبُّ الْعَرْشِ الْعَظِيْمِ.', target: 7, tran: 'Ḥasbiya-Allāhu lā ilāha illā Huwa, ʿalayhi tawakkaltu, wa Huwa Rabbu-l-ʿArshi-l-ʿaẓīm. '),
    ZikrItem(zikr: 'رَضِيْتُ بِاللّٰهِ رَبًّا ، وَبِالْإِسْلَامِ دِيْنًا ، وَبِمُحَمَّدٍ نَّبِيًّا.', target: 3, tran: 'Raḍītu bi-llāhi Rabbā, wa bi-l-islāmi dīnā, wa bi Muḥammadin-Nabiyyā.'),
    ZikrItem(zikr: 'بِسْمِ اللّٰهِ الَّذِيْ لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ ، وَهُوَ السَّمِيْعُ الْعَلِيْمُ.', target: 3, tran: 'Bismi-llāhi-lladhī lā yaḍurru maʿasmihi shay’un fi-l-arḍi wa lā fi-s-samā’, wa Huwa-s-Samīʿu-l-ʿAlīm.'),
    ZikrItem(zikr: 'سُبْحَانَ اللّٰهِ وَبِحَمْدِهِ.', target: 100, tran: 'Subḥāna-llāhi wa bi ḥamdih.'),
    ZikrItem(zikr: 'لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيْرٌ.', target: 100, tran: 'Lā ilāha illā-Allāh, waḥdahū lā sharīka lah, lahu-l-mulk, wa lahu-l-ḥamd, wa Huwa ʿalā kulli shay’in Qadīr.'),
    ZikrItem(zikr: 'سُبْحَانَ اللّٰهِ ، اَلْحَمْدُ لِلّٰهِ ، اَللّٰهُ أَكْبَرُ.', target: 100, tran: 'Subḥāna-llāh, Alḥamdu li-llāh, Allāhu akbar.'),
    ZikrItem(zikr: 'اَللّٰهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَّعَلَىٰ اٰلِ مُحَمَّدٍ، اَللّٰهُمَّ بَارِكْ عَلَىٰ مُحَمَّدٍ وَّعَلَىٰ اٰلِ مُحَمَّدٍ.', target: 10, tran: 'Allāhumma ṣalli ʿalā Muḥammad wa ʿalā āli Muḥammad, Allāhumma bārik ʿalā Muḥammad, wa ʿalā āli Muḥammad. '),
    ZikrItem(zikr: 'أَسْتَغْفِرُ اللّٰهَ وَأَتُوْبُ إِلَيْهِ.', target: 100, tran: 'Astaghfiru-l-llāha wa atūbu ilayh'),
    ZikrItem(zikr: 'سُبْحَانَ اللّٰهِ وَبِحَمْدِهِ ، عَدَدَ خَلْقِهِ ، وَرِضَا نَفْسِهِ ، وَزِنَةَ عَرْشِهِ ، وَمِدَادَ كَلِمَاتِهِ.', target: 3, tran: 'Subḥāna-llāhi wa bi ḥamdih, ʿadada khalqih, wa riḍā nafsih, wa zinata ʿarshih, wa midāda kalimātih.'),
  ];

  List<ZikrItem> nightAzkar = [
    ZikrItem(zikr: 'سُبْحَانَ اللّٰهِ.', target: 33, tran: 'Subḥāna-llāh'),
        ZikrItem(zikr: 'اَلْحَمْدُ لِلّٰهِ.', target: 33, tran: 'Alḥamdu li-llāh'),
            ZikrItem(zikr: 'اَللّٰهُ أَكْبَرُ.', target: 34, tran: 'Allāhu akbar.'),
            ZikrItem(zikr: 'أَسْتَغْفِرُ اللَّهَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ وَأَتُوبُ إِلَيْهِ', target: 3, tran: 'Astaghfirullāha alladhī lā ilāha illā huwa, al-ḥayyu al-qayyūmu, wa atūbu ilayh.'),
  ];
  final bool isNight = hourNow >= 20 && hourNow < 23;

 List<ZikrItem> pageViewList = isNight ? nightAzkar : azkar;

      void nextPage() {
    _pageController.nextPage(
      duration: Duration(seconds: 1),
      curve: Curves.easeOutBack,
    );
    if (currentProgress == pageViewList.length - 1) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(myLang.complete)));
    }
  }
    return Scaffold(
      bottomSheet: Stack(
        alignment: .topCenter,
        children: [
          Container(
            alignment: .topLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 0.10 * deviceHeight,
            child: Row(
              children: [
                Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    iconSize: .all(50),
                    backgroundColor: .all(greenColor),
                    foregroundColor: .all(primaryWhite),
                  ),
                  onPressed: () {
                    nextPage();
                  },
                  child: Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _increament(),
            child: Container(
              margin: .only(bottom: 20),
              child: Stack(
                alignment: .center,
                children: [
                 CircularPercentIndicator(radius: 50,
                    backgroundColor: primaryWhite,
                    lineWidth: 15,
                    animationDuration: 200,
                    animateFromLastPercent: true,
                    animation: true,
                    circularStrokeCap: .round,
                    progressColor: greenColor,
                    percent: count / target
                  ),
                  Text(
                    count != 0 ? '$count' : '$target',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(myLang.azkarPageTitle),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: .fromHeight(deviceHeight * 0.02),
          child: LinearProgressIndicator(
            borderRadius: .circular(20),
            minHeight: 10,
            color: greenColor,
            value: currentProgress / pageViewList.length,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: .center,
        children: [
          GestureDetector(
            onTap: () => _increament(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: .circular(30),
                border: .all(color: goldenColor, width: 5),
                color: secondryWhite,
              ),
              margin: .only(top: deviceHeight * 0.05),
              width: deviceWidth * 0.9,
              height: deviceHeight * 0.67,
              child: PageView.builder(
                onPageChanged: (value) => setState(() {
                  target = pageViewList[value].target;
                  count = pageViewList[value].count;
                  currentProgress = value;
                }),
                itemCount: pageViewList.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  final item = pageViewList[index];
                  return Container(
                    margin: .all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 10,
                        children: [
                          Text(
                            item.zikr,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: 45,
                              fontFamily: 'ArabicType',
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            textDirection: .rtl,
                          ),
                          Divider(),
                          Text(item.tran, style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ZikrItem {
  final String zikr;
  final String tran;
  final int target;
  int count;

  ZikrItem({
    required this.zikr,
    required this.target,
    this.count = 0,
    required this.tran,
  });
}
