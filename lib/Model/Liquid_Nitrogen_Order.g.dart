// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Liquid_Nitrogen_Order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LiquidNitrogenOrderAdapter extends TypeAdapter<Liquid_Nitrogen_Order> {
  @override
  final int typeId = 6;

  @override
  Liquid_Nitrogen_Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Liquid_Nitrogen_Order(
      ID: fields[0] as int,
      department_code: fields[1] as String,
      department_name: fields[2] as String,
      ac_name: fields[3] as String,
      hospital_price: fields[4] as int,
      ref_no: fields[5] as String,
      po_date: fields[6] as DateTime,
      requested_by: fields[7] as String,
      telephone_no: fields[8] as String,
      ID_account: fields[9] as int,
      ac_no: fields[10] as String,
      user: fields[11] as String,
      building: fields[12] as String,
      delivered_by: fields[13] as String,
      voucher: fields[14] as int,
      remarks: fields[15] as String,
      status: fields[16] as int,
      dn_file_name: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Liquid_Nitrogen_Order obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.department_code)
      ..writeByte(2)
      ..write(obj.department_name)
      ..writeByte(3)
      ..write(obj.ac_name)
      ..writeByte(4)
      ..write(obj.hospital_price)
      ..writeByte(5)
      ..write(obj.ref_no)
      ..writeByte(6)
      ..write(obj.po_date)
      ..writeByte(7)
      ..write(obj.requested_by)
      ..writeByte(8)
      ..write(obj.telephone_no)
      ..writeByte(9)
      ..write(obj.ID_account)
      ..writeByte(10)
      ..write(obj.ac_no)
      ..writeByte(11)
      ..write(obj.user)
      ..writeByte(12)
      ..write(obj.building)
      ..writeByte(13)
      ..write(obj.delivered_by)
      ..writeByte(14)
      ..write(obj.voucher)
      ..writeByte(15)
      ..write(obj.remarks)
      ..writeByte(16)
      ..write(obj.status)
      ..writeByte(17)
      ..write(obj.dn_file_name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LiquidNitrogenOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
