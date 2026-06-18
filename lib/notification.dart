import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:mohammad_in_24hrs/l10n/app_localizations.dart';
import 'package:mohammad_in_24hrs/main.dart';
import 'package:mohammad_in_24hrs/services/notification_services.dart';
import 'package:mohammad_in_24hrs/services/storage_service.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotificationMainWidget extends StatefulWidget {
  const NotificationMainWidget({super.key});

  @override
  State<NotificationMainWidget> createState() => _NotificationMainWidgetState();
}

class _NotificationMainWidgetState extends State<NotificationMainWidget> {
  List<String> titles = [];
  List<String> descriptions = [];

  void loadData() {
    setState(() {
      titles = SharedPreferencesHelper.getTitles();
      descriptions = SharedPreferencesHelper.getDescriptions();
    });
  }

  Map<DateTime, int> trackerMap = {};

  Future<void> _loadHeatmapData() async {
     trackerMap = await SharedPreferencesHelper.loadHeatMapData();
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    loadData();
    _loadHeatmapData();
  }

void _checked(BuildContext context) async{
                    showDialog(context: context, builder: (context) {
                    return AlertDialog.adaptive(backgroundColor: Color.fromRGBO(255, 255, 255, 0),content: CircularPercentIndicator(radius: 100, percent: 1,
                    progressColor: Colors.green,
                    lineWidth: 20,
                    animation: true,
                    animationDuration: 1500,
                    curve: Curves.easeInOut,
                    circularStrokeCap: .round,
                    ),);
                  },);
                  Timer(Duration(milliseconds: 1600), () => Navigator.pop(context),);
                 DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
                 Map<DateTime, int> currentData = await SharedPreferencesHelper.loadHeatMapData();
                 int currentCount = currentData[today] ?? 0;
                 await SharedPreferencesHelper.saveHeatmapData({today: currentCount + 1});
                 _loadHeatmapData();
}

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final myLang = AppLocalizations.of(context)!;
    var slivers = [
      SliverAppBar(
        centerTitle: true,
        pinned: false,
        snap: false,
        floating: true,
        backgroundColor: Colors.green.shade800,
        expandedHeight: 0.5 * deviceHeight,
        flexibleSpace: FlexibleSpaceBar(
          background: Center(
            child: Container(
              margin: EdgeInsets.only(top: 20,),
              child: SingleChildScrollView(
                child: HeatMapCalendar(
                  weekTextColor: Colors.black,
                  textColor: Colors.black,
                  colorMode: .opacity,
                  colorsets: {1: Colors.amber,},
                  datasets: trackerMap,
                ),
              ),
            ),
          ),
        ),
      ),
      SliverAppBar(
        backgroundColor: Colors.green.shade800,
        title: Text(myLang.selectedSunnahTitle),
        pinned: true,
        shape: RoundedRectangleBorder(
          borderRadius: .only(
            bottomLeft: .circular(30),
            bottomRight: .circular(30),
          ),
        ),
      ),
      SliverList.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
            bool isEnabled = SharedPreferencesHelper.isEnabled(index);

          return Card(
            color: secondryWhite,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ListTile(
              leading: IconButton(
                onPressed: !isEnabled ? null:() async{
                  _checked(context);
                  SharedPreferencesHelper.markHabitClicked(index);
                  setState(() {});
                },
                icon: !isEnabled ? Icon(Icons.check_circle_rounded ) : Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                ),
              ),
              title: Text(titles[index]),
              subtitle: Text(descriptions[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog.adaptive(
                      title: Text(myLang.deletingReminder),
                      content: Text(myLang.deletingReminderContent),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(myLang.deletingReminderCancel),
                        ),
                        TextButton(
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(myLang.deletingReminderSnackbar),
                              ),
                            );
                            Navigator.pop(context);
                            int id = titles[index].hashCode.abs();
                            await NotificationServices().cancelSunnah(id);
                            SharedPreferencesHelper.removeSunnah(index);
                            loadData();
                          },
                          child: Text(
                            myLang.deletingReminderDelete,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationDetailWidget(
                      title: titles[index],
                      desc: descriptions[index],
                    ),
                  ),
                );
                loadData();
              },
            ),
          );
        },
      ),
    ];
    return Scaffold(body: CustomScrollView(slivers: slivers));
  }
}

// --- DETAIL SETTINGS SCREEN ---
class NotificationDetailWidget extends StatefulWidget {
  final String title;
  final String desc;
  const NotificationDetailWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  State<NotificationDetailWidget> createState() =>
      _NotificationDetailWidgetState();
}

class _NotificationDetailWidgetState extends State<NotificationDetailWidget> {
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    _loadSavedTime();
  }


  dynamic _loadSavedTime() async {
    final prefs = await SharedPreferences.getInstance();
    int? hour = prefs.getInt('${widget.title}_hour');
    int? minute = prefs.getInt('${widget.title}_min');
    if (hour != null && minute != null) {
      setState(() => selectedTime = TimeOfDay(hour: hour, minute: minute));
    }
  }

  @override
  Widget build(BuildContext context) {
    final myLang = AppLocalizations.of(context)!;
    return Scaffold(
      bottomSheet: SizedBox(
        width: double.infinity,
        height: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: greenColor,
            foregroundColor: Colors.white,
          ),
          onPressed: selectedTime == null
              ? null
              : () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(myLang.savedReminderMessege)),
                  );
                  Navigator.pop(context);
                  int id = widget.title.hashCode.abs();

                  // 1. Schedule System Notification
                  await NotificationServices().scheduleSunnah(
                    id,
                    widget.title,
                    selectedTime!,
                  );

                  // 2. Persist Time in Storage
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setInt(
                    '${widget.title}_hour',
                    selectedTime!.hour,
                  );
                  await prefs.setInt(
                    '${widget.title}_min',
                    selectedTime!.minute,
                  );
                },
          child: Text(myLang.saveReminderButtonText),
        ),
      ),
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListTile(
                tileColor: greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  selectedTime == null
                      ? "No time set"
                      : selectedTime!.format(context),
                  style: TextStyle(fontSize: selectedTime == null ? null : 70),
                ),
                trailing: selectedTime == null
                    ? Icon(Icons.add_alert)
                    : Icon(Icons.edit_notifications),
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    // This builder is what forces the 24-hour clock UI
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(alwaysUse24HourFormat: true),
                        child: child!,
                      );
                    },
                  );

                  if (picked != null) {
                    setState(() => selectedTime = picked);
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            Text(widget.desc, style: const TextStyle(fontSize: 16)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}


