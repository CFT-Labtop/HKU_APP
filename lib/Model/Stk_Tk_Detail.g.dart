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
