// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_fa_translate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranFaTranslateAdapter extends TypeAdapter<QuranFaTranslate> {
  @override
  final int typeId = 3;

  @override
  QuranFaTranslate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranFaTranslate(
      id: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuranFaTranslate obj) {
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
      other is QuranFaTranslateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranFaTranslate _$QuranFaTranslateFromJson(Map<String, dynamic> json) =>
    QuranFaTranslate(
      id: json['id'] as int,
      text: json['text'] as String,
    );

Map<String, dynamic> _$QuranFaTranslateToJson(QuranFaTranslate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
