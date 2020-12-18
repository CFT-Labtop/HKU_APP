// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Liquid_Nitrogen_Order_Detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LiquidNitrogenOrderDetailAdapter
    extends TypeAdapter<Liquid_Nitrogen_Order_Detail> {
  @override
  final int typeId = 7;

  @override
  Liquid_Nitrogen_Order_Detail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Liquid_Nitrogen_Order_Detail(
      ID: fields[0] as int,
      ID_liquid_nitrogen_order: fields[1] as int,
      article_no: fields[2] as String,
      product_name: fields[3] as String,
      volume: fields[4] as int,
      unit_price: fields[5] as double,
      stock_data_entered: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Liquid_Nitrogen_Order_Detail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.ID_liquid_nitrogen_order)
      ..writeByte(2)
      ..write(obj.article_no)
      ..writeByte(3)
      ..write(obj.product_name)
      ..writeByte(4)
      ..write(obj.volume)
      ..writeByte(5)
      ..write(obj.unit_price)
      ..writeByte(6)
      ..write(obj.stock_data_entered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LiquidNitrogenOrderDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Liquid_Nitrogen_Order_Detail _$Liquid_Nitrogen_Order_DetailFromJson(
    Map<String, dynamic> json) {
  return Liquid_Nitrogen_Order_Detail(
    ID: json['ID'] as int,
    ID_liquid_nitrogen_order: json['ID_liquid_nitrogen_order'] as int,
    article_no: json['article_no'] as String,
    product_name: json['product_name'] as String,
    volume: json['volume'] as int,
    unit_price: (json['unit_price'] as num)?.toDouble(),
    stock_data_entered: json['stock_data_entered'] as String,
  );
}

Map<String, dynamic> _$Liquid_Nitrogen_Order_DetailToJson(
        Liquid_Nitrogen_Order_Detail instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'ID_liquid_nitrogen_order': instance.ID_liquid_nitrogen_order,
      'article_no': instance.article_no,
      'product_name': instance.product_name,
      'volume': instance.volume,
      'unit_price': instance.unit_price,
      'stock_data_entered': instance.stock_data_entered,
    };
