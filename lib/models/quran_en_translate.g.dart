// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_en_translate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranEnTranslateAdapter extends TypeAdapter<QuranEnTranslate> {
  @override
  final int typeId = 2;

  @override
  QuranEnTranslate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranEnTranslate(
      id: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuranEnTranslate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranEnTranslateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranEnTranslate _$QuranEnTranslateFromJson(Map<String, dynamic> json) =>
    QuranEnTranslate(
      id: json['id'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$QuranEnTranslateToJson(QuranEnTranslate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
