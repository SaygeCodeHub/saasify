import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_section.dart';
import 'package:saasify/screens/POS/widgets/products_grid.dart';
import 'package:saasify/widgets/formWidgets/label_and_dropdown_widget.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';

class POSMobile extends StatelessWidget {
  final List<ProductsWithCategories> productsWithCategories;
  final List<CartItemModel> cartItems;
  final int selectedCategory;

  const POSMobile(
      {super.key,
      required this.productsWithCategories,
      required this.cartItems,
      required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !context.read<POSBloc>().showCart,
      onPopInvoked: (pop) {
        if (context.read<POSBloc>().showCart) {
          context.read<POSBloc>().showCart = false;
          context
              .read<POSBloc>()
              .add(ReloadPOS(productsWithCategories: productsWithCategories));
        }
      },
      child: context.read<POSBloc>().showCart
          ? Cart(
              cartItems: cartItems,
              productsWithCategories: productsWithCategories,
            )
          : Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: mobileBodyPadding),
                child: LabelAndTextFieldWidget(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search Products',
                ),
              ),
              const SizedBox(height: spacingStandard),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: mobileBodyPadding),
                child: LabelAndDropdownWidget(
                    items: List.generate(
                        productsWithCategories.length,
                        (index) => CustomDropDownItem(
                            value: index,
                            label: productsWithCategories[index].categoryName)),
                    initialValue: selectedCategory,
                    onChanged: (value) {
                      context.read<POSBloc>().selectedCategory = value + 1;
                      context.read<POSBloc>().add(ReloadPOS(
                          productsWithCategories: productsWithCategories));
                    }),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(mobileBodyPadding),
                    child: ProductsGrid(
                        products: productsWithCategories
                            .firstWhere((element) =>
                                element.categoryId == selectedCategory)
                            .products,
                        selectedCategory: selectedCategory,
                        productsWithCategories: productsWithCategories,
                        cartItems: cartItems)),
              ),
              const Divider(height: 0),
              Visibility(
                visible: cartItems.isNotEmpty,
                child: Container(
                  padding: const EdgeInsets.all(spacingStandard),
                  child: Row(
                    children: [
                      Text(
                          'Total: ${context.read<POSBloc>().billModel.totalAmount}'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          context.read<POSBloc>().showCart = true;
                          context.read<POSBloc>().add(ReloadPOS(
                              productsWithCategories: productsWithCategories));
                        },
                        child: const Text('Settle Bill'),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
    );
  }
}
