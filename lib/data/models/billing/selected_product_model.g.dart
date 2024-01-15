// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedProductModelAdapter extends TypeAdapter<SelectedProductModel> {
  @override
  final int typeId = 0;

  @override
  SelectedProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedProductModel(
      count: fields[0] as int,
      product: fields[1] as Product,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedProductModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.product);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
