import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  var initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        print('______onDidReceiveLocalNotification______');
      });
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    print('______onSelectNotification______');
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    // selectNotificationSubject.add(payload);
  });
}

void requestIOSPermissions() {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
}

void testNoty() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'default_reminder', 'Default reminder', 'Workout',
      importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0,
      'Water App',
      "Don't give up! You don't want all your work to be in vain, do you?",
      platformChannelSpecifics,
      payload: 'default');
}

void setDailyNotifications(int hour, int minutes, {int id = 0}) async {
  var time = Time(hour, minutes, 0);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'default_reminder', 'Default reminder', 'Workout');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Water App',
      "Don't give up! You don't want all your work to be in vain, do you?",
      generateTimeInstance(time),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time);
}

void globalNotInit() async {
  await initNotifications();
  requestIOSPermissions();
}

tz.TZDateTime generateTimeInstance(Time time) {
  tz.initializeTimeZones();
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, time.hour, time.minute);
  if (scheduledDate.isBefore(now)) {
    print(123123213123112);
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  // flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
  //     'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
  //     androidAllowWhileIdle: true);
  return scheduledDate;
}
