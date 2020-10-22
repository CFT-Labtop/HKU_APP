// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Chemical_Waste_Order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChemicalWasteOrderAdapter extends TypeAdapter<Chemical_Waste_Order> {
  @override
  final int typeId = 4;

  @override
  Chemical_Waste_Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chemical_Waste_Order(
      ID: fields[0] as int,
      ID_department: fields[1] as int,
      department_code: fields[2] as String,
      department_name: fields[3] as String,
      ref_no: fields[4] as String,
      location: fields[5] as String,
      po_date: fields[6] as DateTime,
      requested_by: fields[7] as String,
      name_one: fields[8] as String,
      name_two: fields[9] as String,
      telephone_no: fields[10] as String,
      remarks: fields[11] as String,
      status: fields[12] as int,
      dn_file_name: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chemical_Waste_Order obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.ID_department)
      ..writeByte(2)
      ..write(obj.department_code)
      ..writeByte(3)
      ..write(obj.department_name)
      ..writeByte(4)
      ..write(obj.ref_no)
      ..writeByte(5)
      ..write(obj.location)
      ..writeByte(6)
      ..write(obj.po_date)
      ..writeByte(7)
      ..write(obj.requested_by)
      ..writeByte(8)
      ..write(obj.name_one)
      ..writeByte(9)
      ..write(obj.name_two)
      ..writeByte(10)
      ..write(obj.telephone_no)
      ..writeByte(11)
      ..write(obj.remarks)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.dn_file_name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChemicalWasteOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
