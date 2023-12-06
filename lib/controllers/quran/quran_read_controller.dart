import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:quran/models/quran_aya.dart';
import 'package:quran/models/quran_en_translate.dart';
import 'package:quran/models/quran_fa_translate.dart';
import 'package:quran/models/quran_juz.dart';
import 'package:quran/models/quran_sura.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuranReadController extends ChangeNotifier{

  List<QuranAya> _ayas = [];
  List<QuranSura> _suras = [];
  var ayaBox = Hive.box<QuranAya>(EnumHiveQuran.aya.name);
  var suraBox = Hive.box<QuranSura>(EnumHiveQuran.sura.name);
  var faTranslateBox = Hive.box<QuranFaTranslate>(EnumHiveQuran.faTranslate.name);
  var enTranslateBox = Hive.box<QuranEnTranslate>(EnumHiveQuran.enTranslate.name);


  List<QuranAya> get getAyas => _ayas;
  List<QuranSura> get getSuras => _suras;



  setNewAyasFromSuraClick(int suraId){
    QuranSura sura = suraBox.values.where((element) => element.id == suraId).first;
    _ayas = ayaBox.values.where((element) => element.chapterId == sura.id).toList();
    sura.playList = _ayas;
    _suras = [sura];

    notifyListeners();
  }


  setNewAyasFromJuzClick(int juzId){

    int chapterId = ayaBox.values.where((aya) => aya.juz == juzId).first.chapterId;
    int verseStart = ayaBox.values.where((aya) => aya.juz == juzId).first.verse;
    String firstSuraName = suraBox.values.where((sura) => sura.id == chapterId).first.name;
    QuranJuz juz = QuranJuz(id: juzId, firstSura: firstSuraName, verseStart: verseStart);

    _ayas = ayaBox.values.where((element) => element.juz == juz.id).toList();
    _suras = [];
    for (var item in _ayas) {

      var checkExist = _suras.where((element) => element.id == item.chapterId);
      if(checkExist.isEmpty){
        QuranSura sura = suraBox.values.where((element) => element.id == item.chapterId).first;
        sura.playList = _ayas.where((element) => element.chapterId == sura.id).toList();
        _suras.add(sura);
      }

    }

    notifyListeners();
  }




  bool isPlayThisAya(int ayaId, int indexPlayer){
    int index = _ayas.indexWhere((element) => element.id == ayaId);
    return index == indexPlayer;
  }



  String findFaTranslate(int ayaId){
    return faTranslateBox.values.firstWhere((element) => element.id == ayaId).text;
  }

  String findEnTranslate(int ayaId){
    return enTranslateBox.values.firstWhere((element) => element.id == ayaId).text;
  }



}