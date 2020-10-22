// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Dangerous_Goods_Order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DangerousGoodsOrderAdapter extends TypeAdapter<Dangerous_Goods_Order> {
  @override
  final int typeId = 2;

  @override
  Dangerous_Goods_Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dangerous_Goods_Order(
      ID: fields[0] as int,
      department_code: fields[1] as String,
      department_name: fields[2] as String,
      ac_name: fields[3] as String,
      ID_department: fields[4] as int,
      hospital_price: fields[5] as int,
      ref_no: fields[6] as String,
      po_date: fields[7] as DateTime,
      requested_by: fields[8] as String,
      telephone_no: fields[9] as String,
      ID_account: fields[10] as int,
      ac_no: fields[11] as String,
      user: fields[12] as String,
      building: fields[13] as String,
      issued_by: fields[14] as String,
      voucher: fields[15] as int,
      remarks: fields[16] as String,
      status: fields[17] as int,
      dn_file: fields[18] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Dangerous_Goods_Order obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.department_code)
      ..writeByte(2)
      ..write(obj.department_name)
      ..writeByte(3)
      ..write(obj.ac_name)
      ..writeByte(4)
      ..write(obj.ID_department)
      ..writeByte(5)
      ..write(obj.hospital_price)
      ..writeByte(6)
      ..write(obj.ref_no)
      ..writeByte(7)
      ..write(obj.po_date)
      ..writeByte(8)
      ..write(obj.requested_by)
      ..writeByte(9)
      ..write(obj.telephone_no)
      ..writeByte(10)
      ..write(obj.ID_account)
      ..writeByte(11)
      ..write(obj.ac_no)
      ..writeByte(12)
      ..write(obj.user)
      ..writeByte(13)
      ..write(obj.building)
      ..writeByte(14)
      ..write(obj.issued_by)
      ..writeByte(15)
      ..write(obj.voucher)
      ..writeByte(16)
      ..write(obj.remarks)
      ..writeByte(17)
      ..write(obj.status)
      ..writeByte(18)
      ..write(obj.dn_file);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DangerousGoodsOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
