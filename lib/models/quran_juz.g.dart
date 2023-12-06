// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_juz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranJuzAdapter extends TypeAdapter<QuranJuz> {
  @override
  final int typeId = 5;

  @override
  QuranJuz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranJuz(
      id: fields[0] as int,
      firstSura: fields[2] as String,
      verseStart: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuranJuz obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.verseStart)
      ..writeByte(2)
      ..write(obj.firstSura);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranJuzAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranJuz _$QuranJuzFromJson(Map<String, dynamic> json) => QuranJuz(
      id: json['id'] as int,
      firstSura: json['first_sura'] as String,
      verseStart: json['verse_start'] as int,
    );

Map<String, dynamic> _$QuranJuzToJson(QuranJuz instance) => <String, dynamic>{
      'id': instance.id,
      'verse_start': instance.verseStart,
      'first_sura': instance.firstSura,
    };
