import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'product_categories.g.dart';

@HiveType(typeId: 0)
class ProductCategories {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final Uint8List? imageBytes;

  ProductCategories({
    required this.name,
    this.imageBytes,
  });
}
