// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 10;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      ID: fields[0] as int,
      location_code: fields[1] as String,
      location_name: fields[2] as String,
      store_no: fields[3] as String,
      licensed_qty1: fields[4] as int,
      licensed_unit1: fields[5] as String,
      licensed_qty2: fields[6] as int,
      licensed_unit2: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.location_code)
      ..writeByte(2)
      ..write(obj.location_name)
      ..writeByte(3)
      ..write(obj.store_no)
      ..writeByte(4)
      ..write(obj.licensed_qty1)
      ..writeByte(5)
      ..write(obj.licensed_unit1)
      ..writeByte(6)
      ..write(obj.licensed_qty2)
      ..writeByte(7)
      ..write(obj.licensed_unit2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
