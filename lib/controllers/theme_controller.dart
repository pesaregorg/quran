import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';

class ThemeController extends ChangeNotifier{



  // constructor
  ThemeController(){
    _init();
  }



  //values
  var appConfigBox = Hive.box(EnumHiveAppConfig.appConfigBox.name);
  int _themeModeIndex = 0;



  //getters
  int get getThemeModeIndex => _themeModeIndex;





  //setters


  _init() {
    _themeModeIndex = appConfigBox.get(EnumHiveAppConfig.theme.name, defaultValue: 0);
    notifyListeners();
  }

  changeTheme() async{

    if(_themeModeIndex == 0){
      _themeModeIndex = 1;
    }else if(_themeModeIndex == 1){
      _themeModeIndex = 2;
    }else if(_themeModeIndex == 2){
      _themeModeIndex = 0;
    }

    appConfigBox.put(EnumHiveAppConfig.theme.name, _themeModeIndex);
    notifyListeners();
  }



  setThemeModeIndex(int val) {
    appConfigBox.put(EnumHiveAppConfig.theme.name, val);
    _themeModeIndex = val;
    notifyListeners();
  }



}