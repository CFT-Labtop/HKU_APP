// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Dangerous_Goods_Order_Detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DangerousGoodsOrderDetailAdapter
    extends TypeAdapter<Dangerous_Goods_Order_Detail> {
  @override
  final int typeId = 3;

  @override
  Dangerous_Goods_Order_Detail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dangerous_Goods_Order_Detail(
      ID: fields[0] as int,
      ID_dangerous_goods_order: fields[1] as int,
      ID_dangerous_goods: fields[2] as int,
      ID_stock_inventory: fields[3] as int,
      ID_stock_inventory_detail: fields[4] as String,
      article_no: fields[5] as String,
      location: fields[6] as String,
      shelf: fields[7] as String,
      rfid_code: fields[8] as String,
      pick_dept_code: fields[9] as String,
      product_name: fields[10] as String,
      unit_price: fields[11] as double,
      quantity: fields[12] as double,
      pickedQuantity: fields[13] as int,
      volume: fields[14] as double,
      unit: fields[15] as String,
      amount: fields[16] as String,
      product_brand: fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Dangerous_Goods_Order_Detail obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.ID_dangerous_goods_order)
      ..writeByte(2)
      ..write(obj.ID_dangerous_goods)
      ..writeByte(3)
      ..write(obj.ID_stock_inventory)
      ..writeByte(4)
      ..write(obj.ID_stock_inventory_detail)
      ..writeByte(5)
      ..write(obj.article_no)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.shelf)
      ..writeByte(8)
      ..write(obj.rfid_code)
      ..writeByte(9)
      ..write(obj.pick_dept_code)
      ..writeByte(10)
      ..write(obj.product_name)
      ..writeByte(11)
      ..write(obj.unit_price)
      ..writeByte(12)
      ..write(obj.quantity)
      ..writeByte(13)
      ..write(obj.pickedQuantity)
      ..writeByte(14)
      ..write(obj.volume)
      ..writeByte(15)
      ..write(obj.unit)
      ..writeByte(16)
      ..write(obj.amount)
      ..writeByte(17)
      ..write(obj.product_brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DangerousGoodsOrderDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
