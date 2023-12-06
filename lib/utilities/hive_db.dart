import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:quran/models/quran_audio.dart';
import 'package:quran/models/quran_aya.dart';
import 'package:quran/models/quran_en_translate.dart';
import 'package:quran/models/quran_fa_translate.dart';
import 'package:quran/models/quran_sura.dart';



class HiveDB {



  // init hive
  Future<void> initialize() async{

    // init hive
    await Hive.initFlutter();

    // register quran model adapter
    Hive.registerAdapter(QuranAudioAdapter());
    Hive.registerAdapter(QuranSuraAdapter());
    Hive.registerAdapter(QuranAyaAdapter());
    Hive.registerAdapter(QuranEnTranslateAdapter());
    Hive.registerAdapter(QuranFaTranslateAdapter());

    // open quran box
    await Hive.openBox(EnumHiveUser.userBox.name);
    await Hive.openBox(EnumHiveAppConfig.appConfigBox.name);
    await Hive.openBox<QuranAudio>(EnumHiveQuran.audios.name);
    await Hive.openBox<QuranSura>(EnumHiveQuran.sura.name);
    await Hive.openBox<QuranAya>(EnumHiveQuran.aya.name);
    await Hive.openBox<QuranEnTranslate>(EnumHiveQuran.enTranslate.name);
    await Hive.openBox<QuranFaTranslate>(EnumHiveQuran.faTranslate.name);

    // insert first init db
    await _insertData();


  }



  // insert quran first load app
  Future<void> _insertData() async{

    // insert audio
    QuranAudio quranAudio = QuranAudio.empty;
    await quranAudio.insertToDBFromJsonAsset();

    // insert sura
    QuranSura sura = QuranSura.empty;
    await sura.insertToDBFromJsonAsset();

    // insert aya
    QuranAya aya = QuranAya.empty;
    await aya.insertToDBFromJsonAsset();

    // insert en translate
    QuranEnTranslate enTranslate = QuranEnTranslate.empty;
    await enTranslate.insertToDBFromJsonAsset();

    //insert fa translate
    QuranFaTranslate faTranslate = QuranFaTranslate.empty;
    await faTranslate.insertToDBFromJsonAsset();

  }



}