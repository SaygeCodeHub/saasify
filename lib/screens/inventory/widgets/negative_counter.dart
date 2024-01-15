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

class NegativeCounter extends StatelessWidget {
  NegativeCounter({
    super.key,
    required this.product,
  });

  final InventoryProduct product;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (product.stock != 0)
          ? () {
              int removedStock = 0;
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      content: SizedBox(
                          width: kDialogueWidth,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.kReduceStock,
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
                                  child: Form(
                                    key: _formKey,
                                    child: CustomTextField(
                                        validator: (value) {
                                          if (removedStock > product.stock) {
                                            return 'Please enter a number less than current stock';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onTextFieldChanged: (value) {
                                          removedStock = int.parse(value);
                                        }),
                                  ),
                                ),
                                const SizedBox(width: spacingSmall),
                                Expanded(
                                  child: PrimaryButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<InventoryBloc>()
                                              .add(UpdateStock(updateStockMap: {
                                                "stock_id": product.stockId,
                                                "stock": removedStock,
                                                "variant_id": product.variantId,
                                                "increment": false
                                              }));
                                          Navigator.pop(ctx);
                                        }
                                      },
                                      buttonTitle: 'Update'),
                                )
                              ],
                            ),
                          ]))));
            }
          : null,
      child: Container(
        height: kCounterContainerSize,
        width: kCounterContainerSize,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.saasifyLightPaleGrey),
        ),
        child: Center(
            child: (product.stock != 0)
                ? const Icon(
                    Icons.remove,
                    size: kGeneralRadius,
                  )
                : const SizedBox.shrink()),
      ),
    );
  }
}
