// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_aya.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranAyaAdapter extends TypeAdapter<QuranAya> {
  @override
  final int typeId = 1;

  @override
  QuranAya read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranAya(
      id: fields[0] as int,
      chapterId: fields[1] as int,
      verse: fields[2] as int,
      juz: fields[3] as int,
      hizb: fields[4] as int,
      page: fields[5] as int,
      audio: fields[6] as String,
      text: fields[7] as String,
      faTranslate: fields[8] as String?,
      enTranslate: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, QuranAya obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapterId)
      ..writeByte(2)
      ..write(obj.verse)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.hizb)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.audio)
      ..writeByte(7)
      ..write(obj.text)
      ..writeByte(8)
      ..write(obj.faTranslate)
      ..writeByte(9)
      ..write(obj.enTranslate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranAyaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranAya _$QuranAyaFromJson(Map<String, dynamic> json) => QuranAya(
      id: json['id'] as int,
      chapterId: json['chapter_id'] as int,
      verse: json['verse'] as int,
      juz: json['juz'] as int,
      hizb: json['hizb'] as int,
      page: json['page'] as int,
      audio: json['audio'] as String,
      text: json['text'] as String,
      faTranslate: json['fa_translate'] as String?,
      enTranslate: json['en_translate'] as String?,
    );

Map<String, dynamic> _$QuranAyaToJson(QuranAya instance) => <String, dynamic>{
      'id': instance.id,
      'chapter_id': instance.chapterId,
      'verse': instance.verse,
      'juz': instance.juz,
      'hizb': instance.hizb,
      'page': instance.page,
      'audio': instance.audio,
      'text': instance.text,
      'fa_translate': instance.faTranslate,
      'en_translate': instance.enTranslate,
    };
