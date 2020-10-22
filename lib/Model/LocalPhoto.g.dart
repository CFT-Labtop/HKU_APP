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
      type: fields[1] as DeliveryType,
      photoList: (fields[2] as List)?.cast<File>(),
      orderID: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPhoto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.photoList)
      ..writeByte(3)
      ..write(obj.orderID);
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
