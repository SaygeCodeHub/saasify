// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_products_by_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryWithProductsDatumAdapter
    extends TypeAdapter<CategoryWithProductsDatum> {
  @override
  final int typeId = 4;

  @override
  CategoryWithProductsDatum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryWithProductsDatum(
      categoryId: fields[0] as int,
      categoryName: fields[1] as String,
      products: (fields[2] as List).cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryWithProductsDatum obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryWithProductsDatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 3;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      productId: fields[0] as int,
      productName: fields[1] as String,
      brandId: fields[2] as int,
      brandName: fields[3] as String,
      productDescription: fields[4] as String,
      variants: (fields[5] as List).cast<Variant>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.brandId)
      ..writeByte(3)
      ..write(obj.brandName)
      ..writeByte(4)
      ..write(obj.productDescription)
      ..writeByte(5)
      ..write(obj.variants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantAdapter extends TypeAdapter<Variant> {
  @override
  final int typeId = 2;

  @override
  Variant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variant(
      currency: fields[11] as String,
      variantId: fields[0] as int,
      cost: fields[1] as int,
      quantity: fields[2] as int,
      discountPercent: fields[3] as int,
      stockId: fields[4] as int,
      stock: fields[5] as int,
      images: (fields[6] as List).cast<String>(),
      unit: fields[7] as String,
      barcode: fields[8] as int,
      restockReminder: fields[9] as int,
      draft: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Variant obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.variantId)
      ..writeByte(1)
      ..write(obj.cost)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.discountPercent)
      ..writeByte(4)
      ..write(obj.stockId)
      ..writeByte(5)
      ..write(obj.stock)
      ..writeByte(6)
      ..write(obj.images)
      ..writeByte(7)
      ..write(obj.unit)
      ..writeByte(8)
      ..write(obj.barcode)
      ..writeByte(9)
      ..write(obj.restockReminder)
      ..writeByte(10)
      ..write(obj.draft)
      ..writeByte(11)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
