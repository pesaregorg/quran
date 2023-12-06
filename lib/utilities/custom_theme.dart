import 'package:flutter/material.dart';




class CustomTheme{



  final Color themeColor = Colors.green;


  ThemeData light({required String fontFamily}){
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
        brightness: Brightness.light,
      fontFamily: fontFamily
    );
  }


  ThemeData dark({required String fontFamily}){
    return ThemeData(
        primaryColor: themeColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: themeColor,
          brightness: Brightness.dark
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: fontFamily
    );
  }



}