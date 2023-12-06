import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:quran/models/quran_sura.dart';



class QuranSuraController extends ChangeNotifier{


  // constructor
  QuranSuraController(){
    _init();
  }




  // values
  List<QuranSura> _suras = [];
  var suraBox = Hive.box<QuranSura>(EnumHiveQuran.sura.name);




  // getters
  List<QuranSura> get getSuras => _suras;


  // initialize on constructor
  _init(){
    _suras = suraBox.values.toList();
    notifyListeners();
  }


  // search on suras
  search(String text){

    _suras = suraBox.values.where(
            (sura) => sura.name.contains(text) ||
                sura.englishName.toString().toLowerCase().contains(text.toLowerCase()) ||
                sura.farsiName.contains(text) ||
                sura.id.toString().contains(text)).toList();
    notifyListeners();
  }


}