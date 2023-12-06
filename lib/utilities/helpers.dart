import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quran/utilities/custom_error.dart';
import 'package:quran/utilities/firebase_api.dart';
import 'package:url_launcher/url_launcher.dart';


class Helpers {
  Helpers._();



  static Future<void> launchUri(String link, {LaunchMode? launchMode}) async {

    final Uri url = Uri.parse(link);
    if (!await launchUrl(url, mode: launchMode ?? LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }



  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }





  static navigateToPage({required BuildContext context, required Widget page, bool? rootNavigator}){
    Navigator.of(context, rootNavigator: rootNavigator ?? false).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }


  static pushReplacement({required BuildContext context, required Widget page, bool? rootNavigator}){
    Navigator.of(context, rootNavigator: rootNavigator ?? false).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (Route<dynamic> route) => false);
  }



  static openModal({
    required BuildContext context,
    required Widget child, double? height, Color? barrierColor, bool? isScrollControlled, bool? isDismissible}){
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isDismissible: isDismissible ?? true,
        isScrollControlled: isScrollControlled ?? true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))
        ),
        builder: (BuildContext ctx){
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: child,
          );
        }
    );
  }







  static String? findErrorInRequestErrors({required CustomError? error, required String key}){

    if(error != null){
      if(error.errors != null){
        if(error.errors!.containsKey(key)){
          return error.errors![key][0];
        }
      }
    }
    return null;
  }






  static toast(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white),),
    ));
  }







  static String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';

    return '$minutesStr:$secondsStr';
  }







  static Future<bool> checkInternetConnection() async{


    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        initFirebaseApi();
        return true;
      }
    } on SocketException catch (_) {

    }
    return false;
  }

}