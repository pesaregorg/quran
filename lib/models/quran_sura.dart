import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quran/models/quran_aya.dart';
import 'package:quran/models/quran_model.dart';

part 'quran_sura.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(explicitToJson: true)
class QuranSura extends QuranModel{


  // constructor
  QuranSura({
    required this.id,
    required this.name,
    required this.nozol,
    required this.verseCount,
    required this.enName,
    required this.reval,
    required this.farsiName,
    required this.englishName,
    this.playList,
  });


  // fields name
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String nozol;
  @HiveField(3)
  @JsonKey(name: 'verse_count')
  final int verseCount;
  @HiveField(4)
  @JsonKey(name: 'en_name')
  final String enName;
  @HiveField(5)
  final int reval;
  @HiveField(6)
  @JsonKey(name: 'farsi_name')
  final String farsiName;
  @HiveField(7)
  @JsonKey(name: 'english_name')
  final String englishName;
  final String assetsPath = "assets/quran/chapters.json";
  @HiveField(8)
  @JsonKey(name: 'play_ist', defaultValue: [])
  List<QuranAya>? playList = [];



  // json object to model
  factory QuranSura.fromJson(Map<String, dynamic> json) => _$QuranSuraFromJson(json);

  // model to json object
  Map<String, dynamic> toJson() => _$QuranSuraToJson(this);

  // create empty model
  static QuranSura get empty => QuranSura(id: 0, name: "", nozol: "", verseCount: 0, enName: "", reval: 0, farsiName: "", englishName: "");

  // insert data to hive db from json file
  Future<void> insertToDBFromJsonAsset() async{
    var data = await loadJsonAsset(assetsPath);
    var list = data.map((item) => QuranSura.fromJson(item)).toList();
    var box = Hive.box<QuranSura>(EnumHiveQuran.sura.name);
    if(box.isEmpty){
      box.addAll(list);
    }
  }



}