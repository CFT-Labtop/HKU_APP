// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocalPhoto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPhotoAdapter extends TypeAdapter<LocalPhoto> {
  @override
  final int typeId = 9;

  @override
  LocalPhoto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPhoto(
      ID: fields[0] as int,
      type: fields[1] as String,
      photoList: (fields[2] as List)?.cast<String>(),
      orderID: fields[3] as int,
      ref_no: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPhoto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.photoList)
      ..writeByte(3)
      ..write(obj.orderID)
      ..writeByte(4)
      ..write(obj.ref_no);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalPhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalPhoto _$LocalPhotoFromJson(Map<String, dynamic> json) {
  return LocalPhoto(
    ID: json['ID'] as int,
    type: json['type'] as String,
    photoList: (json['photoList'] as List)?.map((e) => e as String)?.toList(),
    orderID: json['orderID'] as int,
    ref_no: json['ref_no'] as String,
  );
}

Map<String, dynamic> _$LocalPhotoToJson(LocalPhoto instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'type': instance.type,
      'photoList': instance.photoList,
      'orderID': instance.orderID,
      'ref_no': instance.ref_no,
    };
