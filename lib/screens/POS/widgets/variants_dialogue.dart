import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';

class VariantsDialogue extends StatelessWidget {
  const VariantsDialogue({
    super.key,
    required this.products,
    required this.index, required this.productsWithCategories,
  });

  final List<ProductsWithCategories> productsWithCategories;
  final List<Product> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(products[index].productName),
        content: SizedBox(
            height: 300,
            width: 300,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: products[index].variants.length,
                itemBuilder: (context, variantIndex) {
                  return InkWell(
                    onTap: () {
                      context.read<POSBloc>().add(AddCartItem(
                          productsWithCategories: productsWithCategories,
                          productName: products[index].productName,
                          variant: products[index]
                              .variants[variantIndex]));
                    },
                    child: Card(
                        child: Center(
                            child: Text(products[index]
                                .variants[variantIndex]
                                .cost
                                .toString()))),
                  );
                })));
  }
}
