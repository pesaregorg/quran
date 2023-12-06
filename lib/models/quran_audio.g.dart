// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_audio.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranAudioAdapter extends TypeAdapter<QuranAudio> {
  @override
  final int typeId = 0;

  @override
  QuranAudio read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranAudio(
      id: fields[0] as int,
      name: fields[1] as String,
      dirName: fields[2] as String,
      url: fields[3] as String,
      order: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuranAudio obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dirName)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranAudioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranAudio _$QuranAudioFromJson(Map<String, dynamic> json) => QuranAudio(
      id: json['id'] as int,
      name: json['name'] as String,
      dirName: json['dir_name'] as String,
      url: json['url'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$QuranAudioToJson(QuranAudio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dir_name': instance.dirName,
      'url': instance.url,
      'order': instance.order,
    };
