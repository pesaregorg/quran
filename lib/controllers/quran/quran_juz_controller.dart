import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:quran/models/quran_aya.dart';
import 'package:quran/models/quran_juz.dart';
import 'package:quran/models/quran_sura.dart';



class QuranJuzController extends ChangeNotifier{


  // constructor
  QuranJuzController(){
    _init();
  }




  // values
  final List<QuranJuz> _juzs = [];
  var suraBox = Hive.box<QuranSura>(EnumHiveQuran.sura.name);
  var ayaBox = Hive.box<QuranAya>(EnumHiveQuran.aya.name);



  // getters
  List<QuranJuz> get getJuzs => _juzs;


  // initialize on constructor
  _init(){

    for(int i = 1; i <= 30; i++){
      int chapterId = ayaBox.values.where((aya) => aya.juz == i).first.chapterId;
      int verseStart = ayaBox.values.where((aya) => aya.juz == i).first.verse;
      String firstSuraName = suraBox.values.where((sura) => sura.id == chapterId).first.name;

      _juzs.add(QuranJuz(id: i, firstSura: firstSuraName, verseStart: verseStart));
    }

    notifyListeners();
  }

}