import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {

  void initialize() async{
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'joy_vpn_foreground',
      'JOY VPN FOREGROUND SERVICE',
      description:
      'JOY VPN FOREGROUND SERVICE CREATE NOTIFICATION',
      importance: Importance.high,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    if (Platform.isIOS || Platform.isAndroid) {
      await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          iOS: DarwinInitializationSettings(),
          android: AndroidInitializationSettings('ic_bg_service_small'),
        ),
      );
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }


  void createAndDisplayNotification(RemoteMessage message) async{

    try{
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      flutterLocalNotificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'joy_vpn_foreground',
            'JOY VPN FOREGROUND SERVICE',
            icon: 'ic_bg_service_small',
            ongoing: false,
          ),
        ),
      );
    } on Exception catch(error){
      print(error);
    }
  }
}