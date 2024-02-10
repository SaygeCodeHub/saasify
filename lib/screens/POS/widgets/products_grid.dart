import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/variants_dialogue.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.selectedCategory,
  });

  final List<Product> products;
  final int selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingStandard),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return VariantsDialogue(
                            products: products, index: index);
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
