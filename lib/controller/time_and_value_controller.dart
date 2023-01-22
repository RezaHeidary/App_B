import 'package:timezone/browser.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:appc/view/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../model/value_and_time_model.dart';
import 'package:timezone/timezone.dart';

class DataAndTimeController extends GetxController {
  late Rx<DateTime> time = DateTime.now().obs;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


 // use in pages

  getInsert() {
    // ignore: invalid_use_of_protected_member
    TimeModel.listTime.add(time.value);
  }

  getUpdate(index) {
    // ignore: invalid_use_of_protected_member
    TimeModel.listTime[index] = time.value;
  }

  getDelete(index)async{
  TimeModel.listTime.removeAt(index);
  if(TimeModel.listTime.isNotEmpty){
     getNotifications();
  }
  else{
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  }

  getNotifications() {
    initNotifications();
    TimeModel.listTime.sort();
    showNotification(
      title: "",
      body:
          "${TimeModel.listTime[0].hour.toString()} : ${TimeModel.listTime[0].minute.toString()}",
    );
    print(TimeModel.listTime[0]);
  }

  
 // Notifications settings
 
  showNotification(
      {int id = 0, String? title, String? body, String? pyload}) async {
// ignore: prefer_const_constructors
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      TZDateTime.from(
        TimeModel.listTime[0],
        tz.local,
      ),
      await _notificationDetails(),
      payload: pyload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        icon: "@mipmap/ic_launcher",
        priority: Priority.high,
      ),
      //iOS: IOSNotificationDetails(),
    );
  }

  initNotifications() async {
    print("ww");
    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // ignore: prefer_const_declarations
    final InitializationSettings initializationSettings =
        const InitializationSettings(
            android: initializationSettingsAndroid, macOS: null);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
                  TimeModel.listTime.removeAt(0);
                    if (TimeModel.listTime.isNotEmpty) {
                   getNotifications();
                  }
          Get.offAll(HomeScreen(),);

      }
    );
  }





}
