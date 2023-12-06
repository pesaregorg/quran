import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/enums/hive_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quran/models/quran_model.dart';

part 'quran_audio.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class QuranAudio extends QuranModel{


  // constructor
  QuranAudio({
    required this.id,
    required this.name,
    required this.dirName,
    required this.url,
    required this.order,
  });



  // fields name
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  @JsonKey(name: 'dir_name')
  final String dirName;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final int order;
  final String assetsPath = "assets/quran/audios.json";



  // json object to model
  factory QuranAudio.fromJson(Map<String, dynamic> json) => _$QuranAudioFromJson(json);

  // model to json object
  Map<String, dynamic> toJson() => _$QuranAudioToJson(this);

  // create empty model
  static QuranAudio get empty => QuranAudio(id: 0, name: "", dirName: "", url: "", order: 0);

  // insert data to hive db from json file
  Future<void> insertToDBFromJsonAsset() async{
    var data = await loadJsonAsset(assetsPath);
    var list = data.map((item) => QuranAudio.fromJson(item)).toList();
    var box = Hive.box<QuranAudio>(EnumHiveQuran.audios.name);
    if(box.isEmpty){
      box.addAll(list);
    }
  }



}