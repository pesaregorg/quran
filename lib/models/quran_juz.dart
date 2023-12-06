import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quran/models/quran_model.dart';

part 'quran_juz.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(explicitToJson: true)
class QuranJuz extends QuranModel{


  // constructor
  QuranJuz({
    required this.id,
    required this.firstSura,
    required this.verseStart
  });


  // fields name
  @HiveField(0)
  final int id;
  @HiveField(1)
  @JsonKey(name: 'verse_start')
  final int verseStart;
  @HiveField(2)
  @JsonKey(name: 'first_sura')
  final String firstSura;



  // json object to model
  factory QuranJuz.fromJson(Map<String, dynamic> json) => _$QuranJuzFromJson(json);

  // model to json object
  Map<String, dynamic> toJson() => _$QuranJuzToJson(this);

  // create empty model
  static QuranJuz get empty => QuranJuz(id: 0, firstSura: "", verseStart: 0);




}