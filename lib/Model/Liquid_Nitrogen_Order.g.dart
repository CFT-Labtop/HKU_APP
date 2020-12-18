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
      dn_file: fields[17] as String,
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
      ..write(obj.dn_file);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Liquid_Nitrogen_Order _$Liquid_Nitrogen_OrderFromJson(
    Map<String, dynamic> json) {
  return Liquid_Nitrogen_Order(
    ID: json['ID'] as int,
    department_code: json['department_code'] as String,
    department_name: json['department_name'] as String,
    ac_name: json['ac_name'] as String,
    hospital_price: json['hospital_price'] as int,
    ref_no: json['ref_no'] as String,
    po_date: BaseModel.fromJsonDateTime(json['po_date'] as String),
    requested_by: json['requested_by'] as String,
    telephone_no: json['telephone_no'] as String,
    ID_account: json['ID_account'] as int,
    ac_no: json['ac_no'] as String,
    user: json['user'] as String,
    building: json['building'] as String,
    delivered_by: json['delivered_by'] as String,
    voucher: json['voucher'] as int,
    remarks: json['remarks'] as String,
    status: json['status'] as int,
    dn_file: json['dn_file'] as String,
  );
}

Map<String, dynamic> _$Liquid_Nitrogen_OrderToJson(
        Liquid_Nitrogen_Order instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'department_code': instance.department_code,
      'department_name': instance.department_name,
      'ac_name': instance.ac_name,
      'hospital_price': instance.hospital_price,
      'ref_no': instance.ref_no,
      'po_date': BaseModel.toJsonDateTime(instance.po_date),
      'requested_by': instance.requested_by,
      'telephone_no': instance.telephone_no,
      'ID_account': instance.ID_account,
      'ac_no': instance.ac_no,
      'user': instance.user,
      'building': instance.building,
      'delivered_by': instance.delivered_by,
      'voucher': instance.voucher,
      'remarks': instance.remarks,
      'status': instance.status,
      'dn_file': instance.dn_file,
    };
