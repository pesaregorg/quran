import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';

class QuranSettingsController extends ChangeNotifier{


  QuranSettingsController(){
    _init();
  }

  // values
  bool _showTranslation = true;
  double _fontSize = 28.0;
  var userBox = Hive.box(EnumHiveUser.userBox.name);



  // getters
  bool get getShowTranslation => _showTranslation;

  double get getFontSize => _fontSize;





  _init(){
    _fontSize = userBox.get(EnumHiveUser.quranFontSize.name, defaultValue: 28.0);
    _showTranslation = userBox.get(EnumHiveUser.quranShowTranslation.name, defaultValue: true);
    notifyListeners();
  }






  minusFontSize(){
    if(_fontSize > 8){
      _fontSize = _fontSize-1;
      userBox.put(EnumHiveUser.quranFontSize.name, _fontSize);
      notifyListeners();
    }
  }


  plusFontSize(){
    if(_fontSize < 60){
      _fontSize = _fontSize+1;
      userBox.put(EnumHiveUser.quranFontSize.name, _fontSize);
      notifyListeners();
    }
  }


  toggleShowTranslation(){
    _showTranslation = !_showTranslation;
    userBox.put(EnumHiveUser.quranShowTranslation.name, _showTranslation);
    notifyListeners();
  }



}