import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import 'package:saasify/widgets/primary_button.dart';

class PositiveCounter extends StatelessWidget {
  const PositiveCounter({
    super.key,
    required this.product,
  });

  final InventoryProduct product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          int addedStock = 0;
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                  content: SizedBox(
                      width: kDialogueWidth,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.kAddStock,
                                    style: Theme.of(context)
                                        .textTheme
                                        .xTiniest
                                        .copyWith(fontWeight: FontWeight.w700)),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.close,
                                          color: AppColor.saasifyGrey),
                                    )),
                              ],
                            ),
                            const SizedBox(height: spacingMedium),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(StringConstants.kNameWithColon,
                                      style:
                                          Theme.of(context).textTheme.xTiniest),
                                  const SizedBox(width: spacingXMedium),
                                  Text(product.productName,
                                      textAlign: TextAlign.left,
                                      style:
                                          Theme.of(context).textTheme.xTiniest),
                                  const SizedBox(width: spacingXXXHuge),
                                  Text(StringConstants.kStockWithColon,
                                      style:
                                          Theme.of(context).textTheme.xTiniest),
                                  const SizedBox(width: spacingXMedium),
                                  Text(product.stock.toString(),
                                      style:
                                          Theme.of(context).textTheme.xTiniest),
                                ]),
                            const SizedBox(height: spacingStandard),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onTextFieldChanged: (value) {
                                        addedStock = int.parse(value);
                                      }),
                                ),
                                const SizedBox(width: spacingSmall),
                                Expanded(
                                  child: PrimaryButton(
                                      onPressed: () {
                                        context
                                            .read<InventoryBloc>()
                                            .add(UpdateStock(updateStockMap: {
                                              "stock_id": product.stockId,
                                              "stock": addedStock,
                                              "variant_id": product.variantId,
                                              "increment": true
                                            }));
                                        Navigator.pop(ctx);
                                      },
                                      buttonTitle: 'Update'),
                                )
                              ],
                            ),
                          ]))));
        },
        child: Container(
            height: kCounterContainerSize,
            width: kCounterContainerSize,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.saasifyLightPaleGrey),
            ),
            child: const Center(child: Icon(Icons.add, size: kGeneralRadius))));
  }
}
