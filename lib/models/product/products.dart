import 'package:hive/hive.dart';
import 'package:saasify/models/product/product_variant.dart';

import '../../hiveConfigs/hive_type_ids.dart';

part 'products.g.dart';

@HiveType(typeId: HiveTypeIds.products)
class Products {
  @HiveField(0)
  late int productId;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String category; // Category/Department
  @HiveField(3)
  late double tax; // Tax
  @HiveField(4)
  late String supplier; // Supplier
  @HiveField(5)
  late int minStockLevel; // Minimum Stock Level
  @HiveField(6)
  late String description; // Product Description
  @HiveField(7)
  late String imageUrl; // Image URL
  @HiveField(8)
  late DateTime dateAdded; // Date Added/Last Updated
  @HiveField(9)
  late bool isActive; // Active/Inactive Status
  @HiveField(10)
  late List<ProductVariant> variants; // Variants

  Products({
    required this.productId,
    required this.name,
    required this.category,
    required this.variants,
    this.tax = 0.0, // Default value for tax
    this.supplier = '', // Default value for supplier
    this.minStockLevel = 0, // Default value for reorderPoint
    this.description = '', // Default value for description
    this.imageUrl = '', // Default value for imageUrl
    DateTime? dateAdded, // Optional parameter for dateAdded
    bool isActive = false, // Default value for isActive
  }) : dateAdded = dateAdded ??
            DateTime
                .now(); // Initialize dateAdded with current date if not provided

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'supplier': supplier,
      'tax': tax,
      'minStockLevel': minStockLevel,
      'dateAdded': dateAdded,
      'isActive': isActive = true,
      'variants': variants
    };
  }
}
