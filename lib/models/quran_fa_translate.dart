import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quran/models/quran_model.dart';

part 'quran_fa_translate.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(explicitToJson: true)
class QuranFaTranslate extends QuranModel{


  // constructor
  QuranFaTranslate({
    required this.id,
    required this.text,
  });



  // fields name
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String text;
  final String assetsPath = "assets/quran/fa_translates.json";



  // json object to model
  factory QuranFaTranslate.fromJson(Map<String, dynamic> json) => _$QuranFaTranslateFromJson(json);

  // model to json object
  Map<String, dynamic> toJson() => _$QuranFaTranslateToJson(this);

  // create empty model
  static QuranFaTranslate get empty => QuranFaTranslate(id: 0, text: "");

  // insert data to hive db from json file
  Future<void> insertToDBFromJsonAsset() async{
    var data = await loadJsonAsset(assetsPath);
    var list = data.map((item) => QuranFaTranslate.fromJson(item)).toList();
    var box = Hive.box<QuranFaTranslate>(EnumHiveQuran.faTranslate.name);
    if(box.isEmpty){
      box.addAll(list);
    }
  }



}