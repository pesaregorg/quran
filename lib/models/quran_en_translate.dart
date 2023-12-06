import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quran/models/quran_model.dart';

part 'quran_en_translate.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class QuranEnTranslate extends QuranModel{


  // constructor
  QuranEnTranslate({
    required this.id,
    required this.text,
  });



  // fields name
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String text;
  final String assetsPath = "assets/quran/en_translates.json";



  // json object to model
  factory QuranEnTranslate.fromJson(Map<String, dynamic> json) => _$QuranEnTranslateFromJson(json);

  // model to json object
  Map<String, dynamic> toJson() => _$QuranEnTranslateToJson(this);

  // create empty model
  static QuranEnTranslate get empty => QuranEnTranslate(id: 0, text: "");

  // insert data to hive db from json file
  Future<void> insertToDBFromJsonAsset() async{
    var data = await loadJsonAsset(assetsPath);
    var list = data.map((item) => QuranEnTranslate.fromJson(item)).toList();
    var box = Hive.box<QuranEnTranslate>(EnumHiveQuran.enTranslate.name);
    if(box.isEmpty){
      box.addAll(list);
    }
  }



}