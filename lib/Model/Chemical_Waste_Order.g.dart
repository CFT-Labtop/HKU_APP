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
      dn_file: fields[13] as String,
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
      ..write(obj.dn_file);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chemical_Waste_Order _$Chemical_Waste_OrderFromJson(Map<String, dynamic> json) {
  return Chemical_Waste_Order(
    ID: json['ID'] as int,
    ID_department: json['ID_department'] as int,
    department_code: json['department_code'] as String,
    department_name: json['department_name'] as String,
    ref_no: json['ref_no'] as String,
    location: json['location'] as String,
    po_date: BaseModel.fromJsonDateTime(json['po_date'] as String),
    requested_by: json['requested_by'] as String,
    name_one: json['name_one'] as String,
    name_two: json['name_two'] as String,
    telephone_no: json['telephone_no'] as String,
    remarks: json['remarks'] as String,
    status: json['status'] as int,
    dn_file: json['dn_file'] as String,
  );
}

Map<String, dynamic> _$Chemical_Waste_OrderToJson(
        Chemical_Waste_Order instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'ID_department': instance.ID_department,
      'department_code': instance.department_code,
      'department_name': instance.department_name,
      'ref_no': instance.ref_no,
      'location': instance.location,
      'po_date': BaseModel.toJsonDateTime(instance.po_date),
      'requested_by': instance.requested_by,
      'name_one': instance.name_one,
      'name_two': instance.name_two,
      'telephone_no': instance.telephone_no,
      'remarks': instance.remarks,
      'status': instance.status,
      'dn_file': instance.dn_file,
    };
