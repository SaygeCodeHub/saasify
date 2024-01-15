import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class PaymentDialogue extends StatelessWidget {
  const PaymentDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    final List payments = ["Bank Card", "UPI", "Card", "Other"];
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kGeneralRadius)),
        contentPadding: const EdgeInsets.all(spacingXHuge),
        content: SizedBox(
            height: kDialogueWidth,
            width: kDialogueWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(StringConstants.kPaymentMethods),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close))
              ]),
              const SizedBox(height: spacingStandard),
              Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.2),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(spacingXMedium),
                            child: InkWell(
                                onTap: () {
                                  context.read<BillingBloc>().add(SettleOrder(
                                      paymentMethod: payments[index]));
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.saasifyCementGrey,
                                        borderRadius: BorderRadius.circular(
                                            spacingXMedium)),
                                    child: Center(
                                        child: Text(payments[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .tinier)))));
                      }))
            ])));
  }
}
