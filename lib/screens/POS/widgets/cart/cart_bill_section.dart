import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';

class CartBillSection extends StatelessWidget {
  final List<ProductsWithCategories> productsWithCategories;

  const CartBillSection({
    super.key,
    required this.productsWithCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: spacingXSmall, vertical: spacingStandard),
        child: Card(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: spacingXSmall, vertical: spacingStandard),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Item Total: '),
                        Text(context
                            .read<POSBloc>()
                            .billModel
                            .itemTotal
                            .toStringAsFixed(2)),
                      ]),
                  const Divider(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Discount: '),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: SizedBox(
                                            width: 200,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                    'Enter Discount Percent: '),
                                                const SizedBox(
                                                    height: spacingSmall),
                                                CustomTextField(
                                                  onTextFieldChanged: (value) {
                                                    context
                                                            .read<POSBloc>()
                                                            .billModel
                                                            .discount =
                                                        (double.parse(value));
                                                  },
                                                ),
                                                const SizedBox(
                                                    height: spacingSmall),
                                                PrimaryButton(
                                                    onPressed: () {
                                                      context
                                                          .read<POSBloc>()
                                                          .add(CalculateBill(
                                                              productsWithCategories:
                                                                  productsWithCategories));
                                                      Navigator.pop(context);
                                                    },
                                                    buttonTitle: 'Save')
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.edit,
                                    size: 15, color: AppColors.orange))
                          ],
                        ),
                        Text((context.read<POSBloc>().billModel.discount /
                                100 *
                                context.read<POSBloc>().billModel.itemTotal)
                            .toStringAsFixed(2)),
                      ]),
                  const SizedBox(height: spacingSmallest),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('Taxes: '),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: SizedBox(
                                            width: 200,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                    'Enter Tax Percent: '),
                                                const SizedBox(
                                                    height: spacingSmall),
                                                CustomTextField(
                                                  onTextFieldChanged: (value) {
                                                    context
                                                            .read<POSBloc>()
                                                            .billModel
                                                            .tax =
                                                        (double.parse(value));
                                                  },
                                                ),
                                                const SizedBox(
                                                    height: spacingSmall),
                                                PrimaryButton(
                                                    onPressed: () {
                                                      context
                                                          .read<POSBloc>()
                                                          .add(CalculateBill(
                                                              productsWithCategories:
                                                                  productsWithCategories));
                                                      Navigator.pop(context);
                                                    },
                                                    buttonTitle: 'Save')
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.edit,
                                    size: 15, color: AppColors.orange))
                          ],
                        ),
                        Text((context.read<POSBloc>().billModel.tax /
                                100 *
                                context.read<POSBloc>().billModel.itemTotal)
                            .toStringAsFixed(2)),
                      ]),
                  const Divider(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total: '),
                        Text(context
                            .read<POSBloc>()
                            .billModel
                            .totalAmount
                            .toStringAsFixed(2)),
                      ])
                ]))));
  }
}
