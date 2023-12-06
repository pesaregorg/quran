import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:quran/utilities/local_notification_service.dart';





// init to initialized app and after connection internet
Future<void> initFirebaseApi() async{
  try{
    await Firebase.initializeApp();

    await FirebaseApi().initNotification();
    FirebaseMessaging.onBackgroundMessage(handlerBackground);
  }catch(e){
    debugPrint("firebase not initialized");
  }
}



Future<void> handlerBackground(RemoteMessage message) async{

  if(message.notification != null){

    LocalNotificationService localeNotificationService = LocalNotificationService();
    localeNotificationService.initialize();
    localeNotificationService.createAndDisplayNotification(message);
  }
}








class FirebaseApi{



  final _firebaseMessaging = FirebaseMessaging.instance;





  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    var box = await Hive.openBox(EnumHiveUser.userBox.name);
    box.put(EnumHiveUser.fcmToken.name, fcmToken);
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if(event.notification != null){
        handlerBackground(event);
      }
    });
  }

}