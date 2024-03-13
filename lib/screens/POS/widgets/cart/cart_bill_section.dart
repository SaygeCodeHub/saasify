import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';

class CartBillSection extends StatelessWidget {
  final List<ProductsWithCategories> productsWithCategories;

  const CartBillSection({
    super.key,
    required this.productsWithCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacingStandard),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Bill Details",
            style: Theme.of(context).textTheme.generalSectionHeadingTextStyle),
        const SizedBox(height: spacingSmall),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Item Total: ',
              style: Theme.of(context).textTheme.descriptionTextStyle),
          formatAmount(context.read<POSBloc>().billModel.itemTotal, context),
        ]),
        const Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Discount: ',
                  style: Theme.of(context).textTheme.descriptionTextStyle),
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
                                  const Text('Enter Discount Percent: '),
                                  const SizedBox(height: spacingSmall),
                                  LabelAndTextFieldWidget(
                                    onTextFieldChanged: (value) {
                                      context
                                          .read<POSBloc>()
                                          .billModel
                                          .discount = (double.parse(value!));
                                    },
                                  ),
                                  const SizedBox(height: spacingSmall),
                                  PrimaryButton(
                                      onPressed: () {
                                        context.read<POSBloc>().add(
                                            CalculateBill(
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
                  icon:
                      const Icon(Icons.edit, size: 15, color: AppColors.orange))
            ],
          ),
          formatAmount(
              context.read<POSBloc>().billModel.discount /
                  100 *
                  context.read<POSBloc>().billModel.itemTotal,
              context),
        ]),
        const SizedBox(height: spacingSmallest),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Text('Taxes: ',
                  style: Theme.of(context).textTheme.descriptionTextStyle),
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
                                  const Text('Enter Tax Percent: '),
                                  const SizedBox(height: spacingSmall),
                                  LabelAndTextFieldWidget(
                                    onTextFieldChanged: (value) {
                                      context.read<POSBloc>().billModel.tax =
                                          (double.parse(value!));
                                    },
                                  ),
                                  const SizedBox(height: spacingSmall),
                                  PrimaryButton(
                                      onPressed: () {
                                        context.read<POSBloc>().add(
                                            CalculateBill(
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
                  icon:
                      const Icon(Icons.edit, size: 15, color: AppColors.orange))
            ],
          ),
          formatAmount(
              context.read<POSBloc>().billModel.tax /
                  100 *
                  context.read<POSBloc>().billModel.itemTotal,
              context),
        ]),
        const Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Total: ',
              style: Theme.of(context).textTheme.descriptionTextStyle),
          formatAmount(context.read<POSBloc>().billModel.totalAmount, context),
        ])
      ]),
    );
  }
}
