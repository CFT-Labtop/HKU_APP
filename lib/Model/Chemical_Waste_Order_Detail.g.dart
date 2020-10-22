// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Chemical_Waste_Order_Detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChemicalWasteOrderDetailAdapter
    extends TypeAdapter<Chemical_Waste_Order_Detail> {
  @override
  final int typeId = 5;

  @override
  Chemical_Waste_Order_Detail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chemical_Waste_Order_Detail(
      ID: fields[0] as int,
      ID_chemical_waste_order: fields[1] as int,
      waste_code: fields[2] as String,
      waste_type: fields[3] as String,
      medical_waste: fields[4] as int,
      container_no: fields[5] as int,
      capacity: fields[6] as int,
      capacity_unit: fields[7] as String,
      capacity_volume: fields[8] as int,
      collected_unit: fields[9] as String,
      shortName: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chemical_Waste_Order_Detail obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.ID_chemical_waste_order)
      ..writeByte(2)
      ..write(obj.waste_code)
      ..writeByte(3)
      ..write(obj.waste_type)
      ..writeByte(4)
      ..write(obj.medical_waste)
      ..writeByte(5)
      ..write(obj.container_no)
      ..writeByte(6)
      ..write(obj.capacity)
      ..writeByte(7)
      ..write(obj.capacity_unit)
      ..writeByte(8)
      ..write(obj.capacity_volume)
      ..writeByte(9)
      ..write(obj.collected_unit)
      ..writeByte(10)
      ..write(obj.shortName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChemicalWasteOrderDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
