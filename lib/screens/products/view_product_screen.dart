import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../models/product/products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsBox = Hive.box<Products>('products');
    final List<Products> products = productsBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProductDetailsScreen(product: product),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
