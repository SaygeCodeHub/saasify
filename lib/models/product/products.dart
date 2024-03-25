import 'package:hive/hive.dart';
import 'package:saasify/models/product/product_variant.dart';
part 'products.g.dart';

@HiveType(typeId: 1)
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
  late int reorderPoint; // Reorder Point
  @HiveField(7)
  late String description; // Product Description
  @HiveField(8)
  late String imageUrl; // Image URL
  @HiveField(9)
  late DateTime dateAdded; // Date Added/Last Updated
  @HiveField(10)
  late bool isActive; // Active/Inactive Status
  @HiveField(11)
  late List<ProductVariant> variants; // Variants

  Products({
    required this.productId,
    required this.name,
    required this.category,
    required this.variants,
    this.tax = 0.0, // Default value for tax
    this.supplier = '', // Default value for supplier
    this.minStockLevel = 0, // Default value for minStockLevel
    this.reorderPoint = 0, // Default value for reorderPoint
    this.description = '', // Default value for description
    this.imageUrl = '', // Default value for imageUrl
    DateTime? dateAdded, // Optional parameter for dateAdded
    bool isActive = false, // Default value for isActive
  }) : dateAdded = dateAdded ?? DateTime.now(); // Initialize dateAdded with current date if not provided
}
