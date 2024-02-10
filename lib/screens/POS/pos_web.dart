import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/widgets/custom_dropdown_widget.dart';

class POSWeb extends StatelessWidget {
  final List<ProductsWithCategories> productsWithCategories;
  final int selectedCategory;

  const POSWeb(
      {super.key,
      required this.productsWithCategories,
      required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomDropdownButton(
            hint: 'Select Category',
            items: productsWithCategories
                .map((e) => CustomDropDownItem(
                    value: e.categoryId, label: e.categoryName))
                .toList(),
            selectedValue: null,
            onChanged: (value) {
              context.read<POSBloc>().add(CategorySelected(
                  productsWithCategories: productsWithCategories,
                  selectedCategory: value));
            },
          ),
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: spacingStandard),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: productsWithCategories
                          .firstWhere((element) =>
                              element.categoryId == selectedCategory)
                          .products
                          .length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text(productsWithCategories
                                          .firstWhere((element) =>
                                              element.categoryId ==
                                              selectedCategory)
                                          .products[index]
                                          .productName),
                                      content: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10),
                                            itemCount: productsWithCategories
                                                .firstWhere((element) =>
                                                    element.categoryId ==
                                                    selectedCategory)
                                                .products[index]
                                                .variants
                                                .length,
                                            itemBuilder:
                                                (context, variantIndex) {
                                              return Card(
                                                  child: Center(
                                                      child: Text(productsWithCategories
                                                          .firstWhere((element) =>
                                                              element
                                                                  .categoryId ==
                                                              selectedCategory)
                                                          .products[index]
                                                          .variants[
                                                              variantIndex]
                                                          .cost
                                                          .toString())));
                                            }),
                                      ));
                                });
                          },
                          child: Card(
                              child: Center(
                                  child: Text(productsWithCategories
                                      .firstWhere((element) =>
                                          element.categoryId ==
                                          selectedCategory)
                                      .products[index]
                                      .productName))),
                        );
                      })))
        ]));
  }
}
