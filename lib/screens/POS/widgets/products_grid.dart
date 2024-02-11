import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/variants_dialogue.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.selectedCategory,
    required this.productsWithCategories, required this.cartItems,
  });

  final List<Product> products;
  final List<ProductsWithCategories> productsWithCategories;
  final int selectedCategory;
  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingStandard),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cartItems.isEmpty ? 7 : 5, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return VariantsDialogue(
                            products: products, index: index, productsWithCategories: productsWithCategories);
                      });
                },
                child: Card(
                    child: Column(children: [
                  Center(child: Text(products[index].productName)),
                ])));
          }),
    );
  }
}
