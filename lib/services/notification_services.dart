import 'dart:io';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mohammad_in_24hrs/services/storage_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationServices {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotifacation() async {

    tz.initializeTimeZones();


    final TimezoneInfo timeZoneName = await FlutterTimezone.getLocalTimezone();


    tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(initializationSettings);
  }


  Future<bool?> getPermission() async {
    if (Platform.isIOS) {
      return await notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else if (Platform.isAndroid) {
      return await notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    }
    return null;
  }

  Future<bool?> getExactPermission() async {
    if (Platform.isAndroid) {
      return await notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestExactAlarmsPermission();
    }
    return true;
  }


  static dynamic notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'sunnah_channel',
        'Sunnah Reminders',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }


  Future<void> scheduleSunnah(
    int sunnahId,
    String title,
    TimeOfDay time,
  ) async {
    await notificationsPlugin.zonedSchedule(
      sunnahId,
      'Sunnah Reminder',
      'Time for: $title',
      _nextInstanceOfTime(time.hour, time.minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }



  static final Map<String, List<Map<String, String>>> morningList = {
    "en": [
      {
        "title": "What does your breath say today?",
        "body": "Your breath is noticed before your words.Try miswak.",
      },
      {
        "title": "People may forget your words",
        "body":
            "— but never your behavior. Make yours worth remembering today.",
      },
      {
        "title": "Someone needs your smile",
        "body": "You don’t know who needs it.but Don’t hold it back.",
      },
      {
        "title": "A simple salam can change",
        "body":
            "-How someone feels inside. Be the one who brings that feeling today.",
      },
      {
        "title": "Give yourself Some Beauty",
        "body": "The way you look affects how you feel.",
      },
      {
        "title": "Truth is something",
        "body": "Not everyone can handle it. Be one of the few who can.",
      },
      {
        "title": "Can you notice?",
        "body": "Someone near you needs help right now. Don't walk past?",
      },
    ],
    "fa": [
      {
        "title": "نَفَس تو امروز چه می‌گوید؟",
        "body": "نفس تو قبل از کلماتت احساس می‌شود. مسواک را امتحان کن.",
      },
      {
        "title": "مردم ممکن است حرف‌هایت را فراموش کنند",
        "body":
            "— اما هرگز رفتارت را فراموش نمی‌کنند. امروز کاری کن که به یاد بماند.",
      },
      {
        "title": "کسی به لبخند تو نیاز دارد",
        "body": "نمی‌دانی چه کسی به آن نیاز دارد، اما آن را دریغ نکن.",
      },
      {
        "title": "یک سلام ساده می‌تواند تغییر ایجاد کند",
        "body":
            "-حال درونی یک نفر را. امروز همان کسی باش که این حس را می‌آورد.",
      },
      {
        "title": "کمی زیبایی به خودت بده",
        "body": "ظاهر تو بر احساست تأثیر می‌گذارد.",
      },
      {
        "title": "حقیقت چیزی است",
        "body": "که همه توان پذیرش آن را ندارند. از معدود کسانی باش که دارند.",
      },
      {
        "title": "می‌توانی متوجه شوی؟",
        "body": "کسی نزدیک تو همین حالا به کمک نیاز دارد. بی‌تفاوت عبور نکن.",
      },
    ],
    "ps": [
      {
        "title": "ستا ساه نن څه وايي؟",
        "body": "ستا ساه له خبرو مخکې احساس کېږي. مسواک وکاروه.",
      },
      {
        "title": "خلک ښايي ستا خبرې هېرې کړي",
        "body": "— خو ستا چلند هېڅکله نه هېروي. نن داسې وکړه چې یاد پاتې شي.",
      },
      {
        "title": "یو څوک ستا موسکا ته اړتیا لري",
        "body": "ته نه پوهېږې څوک ورته اړتیا لري، نو مه یې بندوه.",
      },
      {
        "title": "یو ساده سلام بدلون راوستلی شي",
        "body": "-د یو چا په زړه کې. نن هغه څوک شه چې دا احساس راوړي.",
      },
      {
        "title": "ځان ته یو څه ښکلا ورکړه",
        "body": "ستا بڼه پر احساساتو اغېزه کوي.",
      },
      {
        "title": "حقیقت داسې څه دی",
        "body":
            "چې هر څوک یې نه شي زغملی. له هغو لږو کسانو څخه اوسه چې کولی شي.",
      },
      {
        "title": "ایا ته پام کولی شې؟",
        "body": "ستا شاوخوا یو څوک اوس مرستې ته اړتیا لري. مه تېرېږه.",
      },
    ],
    "ar": [
      {
        "title": "ماذا يقول نَفَسُك اليوم؟",
        "body": "يُلاحَظ نَفَسُك قبل كلماتك. جرّب المسواك.",
      },
      {
        "title": "قد ينسى الناس كلماتك",
        "body": "— لكنهم لا ينسون سلوكك أبداً. اجعل سلوكك اليوم لا يُنسى.",
      },
      {
        "title": "هناك من يحتاج ابتسامتك",
        "body": "أنت لا تعرف من يحتاجها، فلا تبخل بها.",
      },
      {
        "title": "السلام البسيط قد يُغيّر",
        "body": "-ما يشعر به شخص في داخله. كن أنت من يصنع هذا الشعور اليوم.",
      },
      {"title": "امنح نفسك بعض الجمال", "body": "مظهرك يؤثر على شعورك."},
      {
        "title": "الحقيقة شيء",
        "body": "ليس الجميع قادرين على تحمّله. كن من القلائل الذين يستطيعون.",
      },
      {
        "title": "هل يمكنك أن تلاحظ؟",
        "body": "هناك شخص قريب منك يحتاج المساعدة الآن. لا تتجاهله.",
      },
    ],
    "de": [
      {
        "title": "Was sagt dein Atem heute?",
        "body":
            "Dein Atem wird vor deinen Worten wahrgenommen. Probiere Miswak.",
      },
      {
        "title": "Menschen könnten deine Worte vergessen",
        "body": "— aber niemals dein Verhalten. Mach es heute unvergesslich.",
      },
      {
        "title": "Jemand braucht dein Lächeln",
        "body": "Du weißt nicht, wer es braucht. Halte es nicht zurück.",
      },
      {
        "title": "Ein einfaches Salam kann verändern",
        "body":
            "-wie sich jemand innerlich fühlt. Sei heute die Person, die das bewirkt.",
      },
      {
        "title": "Gib dir selbst etwas Schönheit",
        "body": "Dein Aussehen beeinflusst, wie du dich fühlst.",
      },
      {
        "title": "Wahrheit ist etwas",
        "body":
            "das nicht jeder ertragen kann. Sei einer der wenigen, die es können.",
      },
      {
        "title": "Kannst du es bemerken?",
        "body":
            "Jemand in deiner Nähe braucht gerade Hilfe. Geh nicht einfach vorbei.",
      },
    ],
    "es": [
      {
        "title": "¿Qué dice tu aliento hoy?",
        "body": "Tu aliento se nota antes que tus palabras. Prueba el miswak.",
      },
      {
        "title": "La gente puede olvidar tus palabras",
        "body":
            "— pero nunca tu comportamiento. Haz que el tuyo valga la pena hoy.",
      },
      {
        "title": "Alguien necesita tu sonrisa",
        "body": "No sabes quién la necesita, no la guardes.",
      },
      {
        "title": "Un simple salam puede cambiar",
        "body":
            "-cómo se siente alguien por dentro. Sé quien traiga ese sentimiento hoy.",
      },
      {
        "title": "Dale a tu vida algo de belleza",
        "body": "Cómo te ves afecta cómo te sientes.",
      },
      {
        "title": "La verdad es algo",
        "body": "que no todos pueden soportar. Sé de los pocos que sí pueden.",
      },
      {
        "title": "¿Puedes notarlo?",
        "body": "Alguien cerca de ti necesita ayuda ahora. No pases de largo.",
      },
    ],
    "ru": [
      {
        "title": "Что говорит твое дыхание сегодня?",
        "body": "Твое дыхание замечают раньше слов. Попробуй мисвак.",
      },
      {
        "title": "Люди могут забыть твои слова",
        "body":
            "— но никогда не забудут твое поведение. Сделай его достойным сегодня.",
      },
      {
        "title": "Кому-то нужна твоя улыбка",
        "body": "Ты не знаешь кому, поэтому не сдерживай ее.",
      },
      {
        "title": "Простое «салам» может изменить",
        "body":
            "-то, что человек чувствует внутри. Будь тем, кто принесет это чувство сегодня.",
      },
      {
        "title": "Дай себе немного красоты",
        "body": "То, как ты выглядишь, влияет на твои чувства.",
      },
      {
        "title": "Правда — это нечто",
        "body":
            "что не каждый может вынести. Будь среди тех немногих, кто может.",
      },
      {
        "title": "Ты можешь заметить?",
        "body":
            "Кто-то рядом с тобой сейчас нуждается в помощи. Не проходи мимо.",
      },
    ],
    "zh": [
      {"title": "你的气息今天在说什么？", "body": "你的气息在你说话之前就被注意到。试试牙刷树枝（Miswak）。"},
      {"title": "人们可能会忘记你的话", "body": "——但永远不会忘记你的行为。让你的行为值得被记住。"},
      {"title": "有人需要你的微笑", "body": "你不知道是谁需要，但不要吝啬它。"},
      {"title": "一个简单的问候可以改变", "body": "-一个人内心的感受。今天做那个带来温暖的人。"},
      {"title": "给自己一些美好", "body": "你的外表会影响你的感受。"},
      {"title": "真相是一件事", "body": "不是每个人都能承受。成为少数能承受的人之一。"},
      {"title": "你能注意到吗？", "body": "你身边有人现在需要帮助。不要忽视。"},
    ],
  };

  static final Map<String, List<Map<String, String>>> noonList = {
    'en': [
      {
        "title": "If it’s on you, fix it today",
        "body": "Some distances stay… just because no one says sorry.",
      },
      {
        "title": "Don’t hold it back",
        "body":
            "What you give today might be exactly what someone is praying for.",
      },
      {
        "title": "Your words could lift them ",
        "body":
            "Someone close to you is struggling silently.say something today.",
      },
      {
        "title": "Charity",
        "body":
            "A small act of giving can outlive you. Do something today that truly matters.",
      },
      {
        "title": "This Friday won’t come back again",
        "body": "Make it count — follow the sunnahs today.",
      },
      {
        "title": " Choose to think good today.",
        "body": "Not every silence is negative, not every look means harm.",
      },
      {
        "title": "Pause for a moment..feel thankful.",
        "body": "There are things in your life others wish for.",
      },
    ],
    'fa': [
      {
        "title": "اگر تقصیر توست، امروز درستش کن",
        "body": "بعضی فاصله‌ها باقی می‌مانند… فقط چون هیچ‌کس عذرخواهی نمی‌کند.",
      },
      {
        "title": "آن را نگه ندار",
        "body":
            "آنچه امروز می‌دهی، شاید دقیقاً همان چیزی باشد که کسی برایش دعا می‌کند.",
      },
      {
        "title": "کلماتت می‌توانند او را بالا ببرند",
        "body": "کسی نزدیک تو در سکوت در حال سختی است. امروز چیزی بگو.",
      },
      {
        "title": "صدقه",
        "body":
            "یک کار کوچکِ بخشش می‌تواند از تو ماندگارتر باشد. امروز کاری کن که واقعاً مهم است.",
      },
      {
        "title": "این جمعه دیگر بازنمی‌گردد",
        "body": "از آن بهترین استفاده را بکن — امروز سنت‌ها را انجام بده.",
      },
      {
        "title": "امروز خوب فکر کردن را انتخاب کن",
        "body": "هر سکوتی منفی نیست، هر نگاهی هم به معنی آسیب نیست.",
      },
      {
        "title": "لحظه‌ای مکث کن... و شکرگزار باش",
        "body": "در زندگی‌ات چیزهایی هست که دیگران آرزویش را دارند.",
      },
    ],
    "ps": [
      {
        "title": "که دا ستا له امله وي، نن یې سم کړه",
        "body": "ځینې واټنونه پاتې کېږي… یوازې ځکه چې هېڅوک بښنه نه غواړي.",
      },
      {
        "title": "مه یې بندوه",
        "body":
            "هغه څه چې ته یې نن ورکوې، کېدای شي هماغه څه وي چې څوک یې دعا کوي.",
      },
      {
        "title": "ستا خبرې کولی شي هغه پورته کړي",
        "body": "ستا نږدې یو څوک په چوپتیا کې ستونزه لري. نن څه ووایه.",
      },
      {
        "title": "صدقه",
        "body":
            "یو کوچنی د ورکولو عمل کولی شي له تا وروسته هم پاتې شي. نن داسې څه وکړه چې رښتیا مهم وي.",
      },
      {
        "title": "دا جمعه بیا نه راځي",
        "body": "ارزښت یې ورکړه — نن سنتونه ترسره کړه.",
      },
      {
        "title": "نن د ښه فکر کولو انتخاب وکړه",
        "body": "هره چوپتیا منفي نه ده، هر نظر هم د زیان معنا نه لري.",
      },
      {
        "title": "یوه شېبه تم شه... شکر وباسه",
        "body": "ستا په ژوند کې داسې څه شته چې نور خلک یې هیله لري.",
      },
    ],
    "ar": [
      {
        "title": "إن كان الخطأ منك، أصلحه اليوم",
        "body": "بعض المسافات تبقى… فقط لأن لا أحد يعتذر.",
      },
      {
        "title": "لا تكتمه",
        "body": "ما تعطيه اليوم قد يكون بالضبط ما يدعو له شخص ما.",
      },
      {
        "title": "كلماتك قد ترفعهم",
        "body": "هناك شخص قريب منك يعاني بصمت. قل شيئًا اليوم.",
      },
      {
        "title": "الصدقة",
        "body":
            "عمل صغير من العطاء قد يبقى بعدك. افعل اليوم شيئًا له قيمة حقيقية.",
      },
      {
        "title": "هذه الجمعة لن تعود مرة أخرى",
        "body": "اجعلها ذات قيمة — اتبع السنن اليوم.",
      },
      {
        "title": "اختر التفكير الجيد اليوم",
        "body": "ليس كل صمتٍ سلبيًا، وليس كل نظرة تعني الأذى.",
      },
      {
        "title": "توقف لحظة... واشعر بالامتنان",
        "body": "في حياتك أشياء يتمنى الآخرون امتلاكها.",
      },
    ],
    "de": [
      {
        "title": "Wenn es an dir liegt, behebe es heute",
        "body": "Manche Distanzen bleiben… nur weil niemand sich entschuldigt.",
      },
      {
        "title": "Halte es nicht zurück",
        "body":
            "Was du heute gibst, könnte genau das sein, wofür jemand betet.",
      },
      {
        "title": "Deine Worte könnten sie aufrichten",
        "body": "Jemand in deiner Nähe kämpft still. Sag heute etwas.",
      },
      {
        "title": "Wohltätigkeit",
        "body":
            "Eine kleine Tat des Gebens kann dich überdauern. Tu heute etwas, das wirklich zählt.",
      },
      {
        "title": "Dieser Freitag kommt nicht zurück",
        "body": "Nutze ihn — folge heute den Sunnah-Handlungen.",
      },
      {
        "title": "Entscheide dich heute, gut zu denken",
        "body":
            "Nicht jedes Schweigen ist negativ, nicht jeder Blick bedeutet Schaden.",
      },
      {
        "title": "Halte einen Moment inne... sei dankbar",
        "body": "In deinem Leben gibt es Dinge, die sich andere wünschen.",
      },
    ],
    "es": [
      {
        "title": "Si depende de ti, arréglalo hoy",
        "body": "Algunas distancias permanecen… solo porque nadie pide perdón.",
      },
      {
        "title": "No lo guardes",
        "body":
            "Lo que des hoy podría ser exactamente lo que alguien está pidiendo en oración.",
      },
      {
        "title": "Tus palabras pueden levantarles",
        "body": "Alguien cercano a ti está luchando en silencio. Di algo hoy.",
      },
      {
        "title": "Caridad",
        "body":
            "Un pequeño acto de dar puede sobrevivirte. Haz hoy algo que realmente importe.",
      },
      {
        "title": "Este viernes no volverá",
        "body": "Haz que cuente — sigue las sunnah hoy.",
      },
      {
        "title": "Elige pensar bien hoy",
        "body": "No todo silencio es negativo, no toda mirada significa daño.",
      },
      {
        "title": "Haz una pausa... siéntete agradecido",
        "body": "Hay cosas en tu vida que otros desean.",
      },
    ],
    "ru": [
      {
        "title": "Если это на тебе, исправь это сегодня",
        "body":
            "Некоторые расстояния остаются… просто потому, что никто не извиняется.",
      },
      {
        "title": "Не сдерживай это",
        "body":
            "То, что ты даёшь сегодня, может быть именно тем, о чём кто-то молится.",
      },
      {
        "title": "Твои слова могут поднять их",
        "body":
            "Кто-то рядом с тобой молча страдает. Скажи что-нибудь сегодня.",
      },
      {
        "title": "Благотворительность",
        "body":
            "Маленький акт отдачи может пережить тебя. Сделай сегодня что-то действительно важное.",
      },
      {
        "title": "Эта пятница не повторится",
        "body": "Сделай её значимой — следуй суннам сегодня.",
      },
      {
        "title": "Выбери думать хорошо сегодня",
        "body": "Не каждое молчание негативно, не каждый взгляд означает вред.",
      },
      {
        "title": "Остановись на мгновение... почувствуй благодарность",
        "body": "В твоей жизни есть то, о чём другие мечтают.",
      },
    ],
    "zh": [
      {"title": "如果问题在你，今天就解决它", "body": "有些距离一直存在……只是因为没有人说对不起。"},
      {"title": "不要压抑它", "body": "你今天给予的，可能正是别人正在祈祷得到的。"},
      {"title": "你的话可以鼓舞他们", "body": "你身边有人正在默默挣扎。今天说点什么吧。"},
      {"title": "慈善", "body": "一个小小的付出可以超越你的存在。今天做一件真正重要的事。"},
      {"title": "这个星期五不会再回来", "body": "让它有意义——今天遵循圣行。"},
      {"title": "今天选择积极思考", "body": "并非每一次沉默都是负面的，也并非每一个眼神都意味着伤害。"},
      {"title": "停下来片刻……心怀感恩", "body": "你的生活中有别人渴望拥有的东西。"},
    ],
  };
  static final Map<String, List<Map<String, String>>> eveninglist = {
    'en': [
      {
        "title": "Today may have been full of challenges.",
        "body":
            " Don’t let that break your consistency.come back stronger tomorrow.",
      },
      {
        "title": "What if tonight was your last?",
        "body": "Why not turn back now — before it’s too late?",
      },
      {
        "title": "While others sleep, a few rise.",
        "body": " Be among those who stand in the night.",
      },
      {
        "title": "Don’t lose hope.",
        "body": "No matter how today went, tomorrow is a new page. ",
      },
      {
        "title": "The day ends",
        "body":
            "but your impact remains. Were you good to those around you today?",
      },
      {
        "title": "Facing yourself at night takes courage.",
        "body": " Be honest — and come back stronger tomorrow.",
      },
      {
        "title": "Prepare your intention",
        "body": "The day is ending.fast tomorrow and rise for qiyam tonight.",
      },
    ],
    'fa': [
      {
        "title": "امروز ممکن است پر از چالش بوده باشد.",
        "body": "اجازه نده این موضوع ثباتت را بشکند. فردا قوی‌تر برگرد.",
      },
      {
        "title": "اگر امشب آخرین شب تو باشد چه؟",
        "body": "چرا همین حالا برنگردی — قبل از اینکه خیلی دیر شود؟",
      },
      {
        "title": "در حالی که دیگران خوابند، عده‌ای برمی‌خیزند.",
        "body": "از کسانی باش که در شب به پا می‌ایستند.",
      },
      {
        "title": "امیدت را از دست نده.",
        "body": "مهم نیست امروز چگونه گذشت، فردا صفحه‌ای تازه است.",
      },
      {
        "title": "روز به پایان می‌رسد",
        "body": "اما اثر تو باقی می‌ماند. آیا امروز با اطرافیانت مهربان بودی؟",
      },
      {
        "title": "روبرو شدن با خودت در شب شجاعت می‌خواهد.",
        "body": "صادق باش — و فردا قوی‌تر برگرد.",
      },
      {
        "title": "نیت خود را آماده کن",
        "body": "روز در حال پایان است. فردا روزه بگیر و امشب برای قیام برخیز.",
      },
    ],
    "ps": [
      {
        "title": "نن ممکن له ننګونو ډک و.",
        "body": "مه پرېږده چې دا ستا دوام کمزوری کړي. سبا لا قوي راستانه شه.",
      },
      {
        "title": "که نن شپه ستا وروستۍ شپه وای نو؟",
        "body": "ولې همدا اوس بېرته نه راګرځې — مخکې له دې چې ناوخته شي؟",
      },
      {
        "title": "کله چې نور ویده وي، ځینې راپاڅي.",
        "body": "له هغو کسانو څخه اوسه چې په شپه کې درېږي.",
      },
      {
        "title": "هیله مه له لاسه ورکوه.",
        "body": "مهمه نه ده چې نن څنګه تېر شو، سبا نوې پاڼه ده.",
      },
      {
        "title": "ورځ پای ته رسېږي",
        "body":
            "خو ستا اغېز پاتې کېږي. ایا نن دې له شاوخوا خلکو سره ښه چلند وکړ؟",
      },
      {
        "title": "په شپه کې له ځان سره مخ کېدل زړورتیا غواړي.",
        "body": "رښتینی اوسه — او سبا لا قوي راشه.",
      },
      {
        "title": "خپل نیت چمتو کړه",
        "body":
            "ورځ پای ته رسېږي. سبا روژه ونیسه او نن شپه د قیام لپاره راپاڅه.",
      },
    ],
    "ar": [
      {
        "title": "قد يكون اليوم مليئًا بالتحديات.",
        "body": "لا تدع ذلك يكسر استمراريتك. عُد أقوى غدًا.",
      },
      {
        "title": "ماذا لو كانت هذه ليلتك الأخيرة؟",
        "body": "لماذا لا تعود الآن — قبل فوات الأوان؟",
      },
      {
        "title": "بينما ينام الآخرون، ينهض القليل.",
        "body": "كن من الذين يقومون في الليل.",
      },
      {"title": "لا تفقد الأمل.", "body": "مهما كان يومك، فغدًا صفحة جديدة."},
      {
        "title": "ينتهي اليوم",
        "body": "لكن أثرك يبقى. هل كنت لطيفًا مع من حولك اليوم؟",
      },
      {
        "title": "مواجهة نفسك في الليل تحتاج شجاعة.",
        "body": "كن صادقًا — وعد أقوى غدًا.",
      },
      {"title": "هيّئ نيتك", "body": "اليوم ينتهي. صم غدًا وقم الليل اليوم."},
    ],
    "de": [
      {
        "title": "Heute war vielleicht voller Herausforderungen.",
        "body":
            "Lass das deine Beständigkeit nicht brechen. Komm morgen stärker zurück.",
      },
      {
        "title": "Was, wenn heute Nacht deine letzte wäre?",
        "body": "Warum kehrst du nicht jetzt um — bevor es zu spät ist?",
      },
      {
        "title": "Während andere schlafen, stehen einige auf.",
        "body": "Sei unter denen, die in der Nacht aufstehen.",
      },
      {
        "title": "Verliere die Hoffnung nicht.",
        "body": "Egal wie dein Tag war, morgen ist eine neue Seite.",
      },
      {
        "title": "Der Tag endet",
        "body":
            "aber dein Einfluss bleibt. Warst du heute gut zu den Menschen um dich herum?",
      },
      {
        "title": "Sich nachts sich selbst zu stellen, braucht Mut.",
        "body": "Sei ehrlich — und komm morgen stärker zurück.",
      },
      {
        "title": "Bereite deine Absicht vor",
        "body":
            "Der Tag endet. Faste morgen und steh heute Nacht zum Gebet auf.",
      },
    ],
    "es": [
      {
        "title": "Hoy pudo haber estado lleno de desafíos.",
        "body":
            "No dejes que eso rompa tu constancia. Vuelve más fuerte mañana.",
      },
      {
        "title": "¿Y si esta noche fuera la última?",
        "body": "¿Por qué no volver ahora — antes de que sea demasiado tarde?",
      },
      {
        "title": "Mientras otros duermen, algunos se levantan.",
        "body": "Sé de aquellos que se levantan en la noche.",
      },
      {
        "title": "No pierdas la esperanza.",
        "body": "No importa cómo haya ido hoy, mañana es una nueva página.",
      },
      {
        "title": "El día termina",
        "body":
            "pero tu impacto permanece. ¿Fuiste bueno con los que te rodean hoy?",
      },
      {
        "title": "Enfrentarte a ti mismo por la noche requiere valor.",
        "body": "Sé honesto — y vuelve más fuerte mañana.",
      },
      {
        "title": "Prepara tu intención",
        "body":
            "El día está terminando. Ayuna mañana y levántate para el qiyam esta noche.",
      },
    ],
    "ru": [
      {
        "title": "Сегодня мог быть полон трудностей.",
        "body":
            "Не позволяй этому сломать твою последовательность. Завтра вернись сильнее.",
      },
      {
        "title": "Что если эта ночь последняя?",
        "body": "Почему бы не вернуться сейчас — пока не стало слишком поздно?",
      },
      {
        "title": "Пока другие спят, некоторые встают.",
        "body": "Будь среди тех, кто встаёт ночью.",
      },
      {
        "title": "Не теряй надежду.",
        "body": "Как бы ни прошёл день, завтра — новая страница.",
      },
      {
        "title": "День заканчивается",
        "body":
            "но твоё влияние остаётся. Был ли ты добр к окружающим сегодня?",
      },
      {
        "title": "Встретиться с собой ночью требует мужества.",
        "body": "Будь честен — и вернись завтра сильнее.",
      },
      {
        "title": "Подготовь своё намерение",
        "body":
            "День заканчивается. Постись завтра и встань на ночную молитву сегодня.",
      },
    ],
    "zh": [
      {"title": "今天可能充满了挑战。", "body": "不要让这些打破你的坚持。明天更强地回来。"},
      {"title": "如果今晚是最后一晚呢？", "body": "为什么不现在回头——趁还不太晚？"},
      {"title": "当别人入睡时，少数人起身。", "body": "成为那些在夜里站起来的人之一。"},
      {"title": "不要失去希望。", "body": "无论今天如何，明天都是新的一页。"},
      {"title": "一天结束了", "body": "但你的影响仍然存在。你今天对身边的人好吗？"},
      {"title": "在夜里面对自己需要勇气。", "body": "诚实面对——明天变得更强。"},
      {"title": "准备你的意图", "body": "一天即将结束。明天斋戒，今晚起来礼夜间拜。"},
    ],
  };

  static Future<void> hardCodedForMorning(int hour, int minute) async {
    final currentLocal = SharedPreferencesHelper.getLocal();
    final localizedList = morningList[currentLocal ?? 'en'];

    final localizedListSat = localizedList![5];
    final localizedListSun = localizedList[6];
    final localizedListMon = localizedList[0];
    final localizedListTue = localizedList[1];
    final localizedListWedn = localizedList[2];
    final localizedListThrs = localizedList[3];
    final localizedListFri = localizedList[4];

    await notificationsPlugin.zonedSchedule(
      5001,
      localizedListSat['title'],
      localizedListSat['body'],
      _nextInstanceOfTimeforSaturday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5002,
      localizedListSun['title'],
      localizedListSun['body'],
      _nextInstanceOfTimeforSunday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5003,
      localizedListMon['title'],
      localizedListMon['body'],
      _nextInstanceOfTimeforMonday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5004,
      localizedListTue['title'],
      localizedListTue['body'],
      _nextInstanceOfTimeforTuesday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5005,
      localizedListWedn['title'],
      localizedListWedn['body'],
      _nextInstanceOfTimeforWednesday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5006,
      localizedListThrs['title'],
      localizedListThrs['body'],
      _nextInstanceOfTimeforThursday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5007,
      localizedListFri['title'],
      localizedListFri['body'],
      _nextInstanceOfTimeforFriday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  static Future<void> hardCodedForNoon(int hour, int minute) async {
    final currentLocal = SharedPreferencesHelper.getLocal();
    final localizedList = noonList[currentLocal ?? 'en'];

    final localizedListSat = localizedList![5];
    final localizedListSun = localizedList[6];
    final localizedListMon = localizedList[0];
    final localizedListTue = localizedList[1];
    final localizedListWedn = localizedList[2];
    final localizedListThrs = localizedList[3];
    final localizedListFri = localizedList[4];

    await notificationsPlugin.zonedSchedule(
      5008,
      localizedListSat['title'],
      localizedListSat['body'],
      _nextInstanceOfTimeforSaturday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5009,
      localizedListSun['title'],
      localizedListSun['body'],
      _nextInstanceOfTimeforSunday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5010,
      localizedListMon['title'],
      localizedListMon['body'],
      _nextInstanceOfTimeforMonday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5011,
      localizedListTue['title'],
      localizedListTue['body'],
      _nextInstanceOfTimeforTuesday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5012,
      localizedListWedn['title'],
      localizedListWedn['body'],
      _nextInstanceOfTimeforWednesday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5013,
      localizedListThrs['title'],
      localizedListThrs['body'],
      _nextInstanceOfTimeforThursday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5014,
      localizedListFri['title'],
      localizedListFri['body'],
      _nextInstanceOfTimeforFriday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  static Future<void> hardCodedForEvening(int hour, int minute) async {
    final currentLocal = SharedPreferencesHelper.getLocal();
    final localizedList = eveninglist[currentLocal ?? 'en'];

    final localizedListSat = localizedList![5];
    final localizedListSun = localizedList[6];
    final localizedListMon = localizedList[0];
    final localizedListTue = localizedList[1];
    final localizedListWedn = localizedList[2];
    final localizedListThrs = localizedList[3];
    final localizedListFri = localizedList[4];

    await notificationsPlugin.zonedSchedule(
      5015,
      localizedListSat['title'],
      localizedListSat['body'],
      _nextInstanceOfTimeforSaturday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5016,
      localizedListSun['title'],
      localizedListSun['body'],
      _nextInstanceOfTimeforSunday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5017,
      localizedListMon['title'],
      localizedListMon['body'],
      _nextInstanceOfTimeforMonday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5018,
      localizedListTue['title'],
      localizedListTue['body'],
      _nextInstanceOfTimeforTuesday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5019,
      localizedListWedn['title'],
      localizedListWedn['body'],
      _nextInstanceOfTimeforWednesday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5020,
      localizedListThrs['title'],
      localizedListThrs['body'],
      _nextInstanceOfTimeforThursday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );

    await notificationsPlugin.zonedSchedule(
      5021,
      localizedListFri['title'],
      localizedListFri['body'],
      _nextInstanceOfTimeforFriday(hour, minute),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  Future<void> hardCodedforAzkar(int id,int hour, int minute) async {
    final Map<String, Map<String, String>> azkarNotification = {
      'en': {
        'title': 'You don’t see Allah’s protection… ',
        "body": "Don’t risk losing it. Do your azkār—tap now.",
      },
      'fa': {
        "title": "تو محافظت خدا را نمی‌بینی…",
        "body":
            "ریسک از دست دادنش را نکن. اذکار خود را انجام بده—همین حالا کلک کن.",
      },
      'ps': {
        "title": "ته د الله ساتنه نه وینې…",
        "body": "د له لاسه ورکولو خطر مه کوه. خپل اذکار وکړه—همدا اوس ټپ کړه.",
      },
      'ar': {
        "title": "أنت لا ترى حماية الله…",
        "body": "لا تُخاطر بفقدانها. قم بأذكارك—اضغط الآن.",
      },
      'de': {
        "title": "Du siehst Allahs Schutz nicht…",
        "body":
            "Riskiere nicht, ihn zu verlieren. Mache deine Adhkār—tippe jetzt.",
      },
      'es': {
        "title": "No ves la protección de Allah…",
        "body": "No arriesgues perderla. Haz tus adhkar—toca ahora.",
      },
      'ru': {
        "title": "Ты не видишь защиту Аллаха…",
        "body": "Не рискуй потерять её. Делай свои азкары—нажми сейчас.",
      },
      'zh': {"title": "你看不到真主的保护……", "body": "不要冒险失去它。完成你的念诵——现在点击。"},
    };
    final String locale = SharedPreferencesHelper.getLocal() ?? 'es';
    dynamic currentNotification = azkarNotification[locale];

    notificationsPlugin.zonedSchedule(
      id,
      currentNotification['title'],
      currentNotification['body'],
      _nextInstanceOfTime(hour, minute),
      notificationDetails(),
      androidScheduleMode: .alarmClock,
      matchDateTimeComponents: .time,
    );
  }


  // --- Helper: Find the next occurrence ---
  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> cancelSunnah(int id) async {
    await notificationsPlugin.cancel(id);
  }
Future<void> cancelAzkar() async {
  for (var i = 7000; i < 7003; i++) {
      await notificationsPlugin.cancel(i);
  }
}

  Future<void> cancelallSunnah() async {
    for (var i = 5000; i < 5022; i++) {
      await notificationsPlugin.cancel(i);
    }
  }
}

tz.TZDateTime _nextInstanceOfTimeforSaturday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.saturday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _nextInstanceOfTimeforSunday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.sunday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _nextInstanceOfTimeforMonday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.monday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _nextInstanceOfTimeforTuesday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.tuesday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _nextInstanceOfTimeforWednesday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.wednesday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _nextInstanceOfTimeforThursday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.thursday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _nextInstanceOfTimeforFriday(int hour, int minute) {
  tz.TZDateTime scheduledDate = NotificationServices()._nextInstanceOfTime(
    hour,
    minute,
  );

  while (scheduledDate.weekday != DateTime.friday) {
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}
