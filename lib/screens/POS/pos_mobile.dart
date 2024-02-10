import 'package:flutter/material.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';

class POSMobile extends StatelessWidget {
  final List<ProductsWithCategories> productsWithCategories;
  const POSMobile({super.key, required this.productsWithCategories});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('POS Mobile'),
    );
  }
}
