import 'dart:typed_data';
import 'package:hive/hive.dart';

import '../../hiveConfigs/hive_type_ids.dart';

part 'product_categories.g.dart';

@HiveType(typeId: HiveTypeIds.productCategories)
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
