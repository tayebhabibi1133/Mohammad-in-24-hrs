import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PermissionService {
static Future<void> requestNotificationPermissions() async {

  await Permission.notification.request();


  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final androidImplementation = flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

  if (androidImplementation != null) {

    await androidImplementation.requestExactAlarmsPermission();
  }
}



  static Future<bool> isEverythingGranted() async {
    return await Permission.notification.isGranted && 
           await Permission.scheduleExactAlarm.isGranted;
  }
}