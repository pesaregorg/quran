// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_sura.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranSuraAdapter extends TypeAdapter<QuranSura> {
  @override
  final int typeId = 4;

  @override
  QuranSura read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranSura(
      id: fields[0] as int,
      name: fields[1] as String,
      nozol: fields[2] as String,
      verseCount: fields[3] as int,
      enName: fields[4] as String,
      reval: fields[5] as int,
      farsiName: fields[6] as String,
      englishName: fields[7] as String,
      playList: (fields[8] as List?)?.cast<QuranAya>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuranSura obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nozol)
      ..writeByte(3)
      ..write(obj.verseCount)
      ..writeByte(4)
      ..write(obj.enName)
      ..writeByte(5)
      ..write(obj.reval)
      ..writeByte(6)
      ..write(obj.farsiName)
      ..writeByte(7)
      ..write(obj.englishName)
      ..writeByte(8)
      ..write(obj.playList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranSuraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranSura _$QuranSuraFromJson(Map<String, dynamic> json) => QuranSura(
      id: json['id'] as int,
      name: json['name'] as String,
      nozol: json['nozol'] as String,
      verseCount: json['verse_count'] as int,
      enName: json['en_name'] as String,
      reval: json['reval'] as int,
      farsiName: json['farsi_name'] as String,
      englishName: json['english_name'] as String,
      playList: (json['play_ist'] as List<dynamic>?)
              ?.map((e) => QuranAya.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$QuranSuraToJson(QuranSura instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nozol': instance.nozol,
      'verse_count': instance.verseCount,
      'en_name': instance.enName,
      'reval': instance.reval,
      'farsi_name': instance.farsiName,
      'english_name': instance.englishName,
      'play_ist': instance.playList?.map((e) => e.toJson()).toList(),
    };
