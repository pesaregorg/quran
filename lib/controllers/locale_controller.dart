import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';


class LocaleController extends ChangeNotifier{


  // constructor
  LocaleController(){
    _init();
  }


  // values
  var appConfigBox = Hive.box(EnumHiveAppConfig.appConfigBox.name);
  Locale _locale = const Locale("en");



  // getters
  Locale get getLocale => _locale;

  String get getFontFamily{
    if(_locale.languageCode == "fa"){
      return "Yekan";
    }

    if(_locale.languageCode == "ar"){
      return "NotoSansArabic";
    }

    return "Poppins";
  }



  List<Map<String, dynamic>> get getCountries{
    return [
      {
        "title": "فارسی",
        "locale": const Locale("fa"),
      },
      {
        "title": "العربية",
        "locale": const Locale("ar"),
      },
      {
        "title": "English",
        "locale": const Locale("en"),
      },
    ];
  }





  _init() {
    String localeName = appConfigBox.get(EnumHiveAppConfig.locale.name, defaultValue: "en");
    _locale = Locale(localeName);
    notifyListeners();
  }



  changeLocale(Locale locale) {
    appConfigBox.put(EnumHiveAppConfig.locale.name, locale.languageCode);
    _locale = locale;
    notifyListeners();
  }






}




