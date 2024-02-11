import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';

class CartBillSection extends StatelessWidget {
  const CartBillSection({
    super.key,
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
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Discount: '),
                          ],
                        ),
                        Text((context.read<POSBloc>().billModel.discount *
                                context.read<POSBloc>().billModel.itemTotal)
                            .toStringAsFixed(2)),
                      ]),
                  const SizedBox(height: spacingSmallest),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text('Taxes: '),
                          ],
                        ),
                        Text((context.read<POSBloc>().billModel.tax *
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
                      ]),
                ]))));
  }
}
