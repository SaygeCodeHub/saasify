import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'adapters/cart_adapter.dart';
import 'models/category/product_categories.dart';
import 'models/product/product_variant.dart';
import 'models/product/products.dart';

Future<void> setupHive() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);

  // Register adapters
  Hive
    ..registerAdapter(ProductCategoriesAdapter())
    ..registerAdapter(ProductsAdapter())
    ..registerAdapter(ProductVariantAdapter())
    ..registerAdapter(CartItemAdapter());

  // Open boxes
  await Future.wait([
    Hive.openBox<ProductCategories>('categories'),
    Hive.openBox<Products>('products'),
    Hive.openBox<Map<String, dynamic>>('cartData'),
  ]);
}
