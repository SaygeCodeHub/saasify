// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillModelAdapter extends TypeAdapter<BillModel> {
  @override
  final int typeId = 1;

  @override
  BillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BillModel(
      gst: fields[1] as double,
      gstPercent: fields[5] as double,
      discountPercent: fields[3] as double,
      itemTotal: fields[0] as double,
      total: fields[4] as double,
      discount: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BillModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.itemTotal)
      ..writeByte(2)
      ..write(obj.discount)
      ..writeByte(3)
      ..write(obj.discountPercent)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.gst)
      ..writeByte(5)
      ..write(obj.gstPercent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
