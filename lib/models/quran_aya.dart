import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quran/models/quran_model.dart';

part 'quran_aya.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class QuranAya extends QuranModel{


  // constructor
  QuranAya({
    required this.id,
    required this.chapterId,
    required this.verse,
    required this.juz,
    required this.hizb,
    required this.page,
    required this.audio,
    required this.text,
    this.faTranslate,
    this.enTranslate
  });



  // fields name
  @HiveField(0)
  final int id;
  @HiveField(1)
  @JsonKey(name: 'chapter_id')
  final int chapterId;
  @HiveField(2)
  final int verse;
  @HiveField(3)
  final int juz;
  @HiveField(4)
  final int hizb;
  @HiveField(5)
  final int page;
  @HiveField(6)
  final String audio;
  @HiveField(7)
  final String text;
  @HiveField(8)
  @JsonKey(name: 'fa_translate')
  String? faTranslate;
  @HiveField(9)
  @JsonKey(name: 'en_translate')
  String? enTranslate;

  final String assetsPath = "assets/quran/ayas.json";



  // json object to model
  factory QuranAya.fromJson(Map<String, dynamic> json) => _$QuranAyaFromJson(json);

  // model to json object
  Map<String, dynamic> toJson() => _$QuranAyaToJson(this);

  // create empty model
  static QuranAya get empty => QuranAya(id: 0, chapterId: 0, verse: 0, juz: 0, hizb: 0, page: 0, audio: "", text: "");

  // insert data to hive db from json file
  Future<void> insertToDBFromJsonAsset() async{
    var data = await loadJsonAsset(assetsPath);
    var list = data.map((item){
      return QuranAya.fromJson(item);
    }).toList();
    var box = Hive.box<QuranAya>(EnumHiveQuran.aya.name);
    if(box.isEmpty){
      box.addAll(list);
    }
  }



}