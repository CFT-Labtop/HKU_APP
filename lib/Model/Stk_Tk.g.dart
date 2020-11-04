// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Stk_Tk.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StkTkAdapter extends TypeAdapter<Stk_Tk> {
  @override
  final int typeId = 14;

  @override
  Stk_Tk read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stk_Tk(
      ID: fields[0] as int,
      ID_qoh: fields[1] as int,
      stk_tk_date: fields[2] as DateTime,
      ID_location: fields[3] as int,
      location_code: fields[4] as String,
      location_name: fields[5] as String,
      store_no: fields[6] as String,
      shelf: fields[7] as String,
      ID_department: fields[8] as int,
      department_code: fields[9] as String,
      department_name: fields[10] as String,
      ID_dangerous_goods: fields[11] as int,
      product_name: fields[12] as String,
      article_no: fields[13] as String,
      stk_tk_total_qty: fields[14] as int,
      create_user: fields[15] as String,
      modify_user: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Stk_Tk obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.ID_qoh)
      ..writeByte(2)
      ..write(obj.stk_tk_date)
      ..writeByte(3)
      ..write(obj.ID_location)
      ..writeByte(4)
      ..write(obj.location_code)
      ..writeByte(5)
      ..write(obj.location_name)
      ..writeByte(6)
      ..write(obj.store_no)
      ..writeByte(7)
      ..write(obj.shelf)
      ..writeByte(8)
      ..write(obj.ID_department)
      ..writeByte(9)
      ..write(obj.department_code)
      ..writeByte(10)
      ..write(obj.department_name)
      ..writeByte(11)
      ..write(obj.ID_dangerous_goods)
      ..writeByte(12)
      ..write(obj.product_name)
      ..writeByte(13)
      ..write(obj.article_no)
      ..writeByte(14)
      ..write(obj.stk_tk_total_qty)
      ..writeByte(15)
      ..write(obj.create_user)
      ..writeByte(16)
      ..write(obj.modify_user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StkTkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
