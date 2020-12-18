// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Version.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VersionAdapter extends TypeAdapter<Version> {
  @override
  final int typeId = 11;

  @override
  Version read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Version(
      ID: fields[0] as int,
      version_name: fields[1] as String,
      qoh_date: fields[2] as DateTime,
      take_location: (fields[3] as List)?.cast<int>(),
      complete_date: fields[4] as DateTime,
      status: fields[5] as bool,
      create_user: fields[6] as String,
      downloaded_location: (fields[7] as List)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Version obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.version_name)
      ..writeByte(2)
      ..write(obj.qoh_date)
      ..writeByte(3)
      ..write(obj.take_location)
      ..writeByte(4)
      ..write(obj.complete_date)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.create_user)
      ..writeByte(7)
      ..write(obj.downloaded_location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version(
    ID: json['ID'] as int,
    version_name: json['version_name'] as String,
    qoh_date: BaseModel.fromJsonDateTime(json['qoh_date'] as String),
    take_location: BaseModel.fromJsonIntList(json['take_location'] as List),
    complete_date: BaseModel.fromJsonDateTime(json['complete_date'] as String),
    status: BaseModel.fromJsonBool(json['status'] as int),
    create_user: json['create_user'] as String,
    downloaded_location:
        BaseModel.fromJsonIntList(json['downloaded_location'] as List),
  );
}

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'ID': instance.ID,
      'version_name': instance.version_name,
      'qoh_date': BaseModel.toJsonDateTime(instance.qoh_date),
      'take_location': instance.take_location,
      'complete_date': BaseModel.toJsonDateTime(instance.complete_date),
      'status': BaseModel.toJsonBool(instance.status),
      'create_user': instance.create_user,
      'downloaded_location': instance.downloaded_location,
    };
