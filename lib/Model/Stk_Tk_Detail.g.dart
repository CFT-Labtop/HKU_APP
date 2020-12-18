// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Stk_Tk_Detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StkTkDetailAdapter extends TypeAdapter<Stk_Tk_Detail> {
  @override
  final int typeId = 15;

  @override
  Stk_Tk_Detail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stk_Tk_Detail(
      ID: fields[0] as int,
      ID_stk_tk: fields[1] as int,
      rfid_code: fields[2] as String,
      stk_tk_qty: fields[3] as int,
      newRecord: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Stk_Tk_Detail obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.ID_stk_tk)
      ..writeByte(2)
      ..write(obj.rfid_code)
      ..writeByte(3)
      ..write(obj.stk_tk_qty)
      ..writeByte(4)
      ..write(obj.newRecord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StkTkDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stk_Tk_Detail _$Stk_Tk_DetailFromJson(Map<String, dynamic> json) {
  return Stk_Tk_Detail(
    ID: json['ID'] as int,
    ID_stk_tk: json['ID_stk_tk'] as int,
    rfid_code: json['rfid_code'] as String,
    stk_tk_qty: json['stk_tk_qty'] as int,
    newRecord: BaseModel.fromJsonBool(json['newRecord'] as int),
  );
}

Map<String, dynamic> _$Stk_Tk_DetailToJson(Stk_Tk_Detail instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'ID_stk_tk': instance.ID_stk_tk,
      'rfid_code': instance.rfid_code,
      'stk_tk_qty': instance.stk_tk_qty,
      'newRecord': BaseModel.toJsonBool(instance.newRecord),
    };
