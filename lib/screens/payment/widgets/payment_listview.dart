import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/payment/payments_bloc.dart';
import 'package:saasify/bloc/payment/payments_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/payment/fetch_all_payment_method.dart';
import 'package:saasify/widgets/alert_dialogue_box.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/toggle_switch_widget.dart';
import 'add_payment_method_popup.dart';

class PaymentTypeListView extends StatelessWidget {
  const PaymentTypeListView({
    super.key,
    required this.paymentType,
  });

  final List<PaymentData> paymentType;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: paymentType.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: spacingXXHuge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCircularRadius),
                boxShadow: const [
                  BoxShadow(
                      color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                ],
                color: AppColor.saasifyWhite),
            child: Padding(
                padding: const EdgeInsets.all(kCircularRadius),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: spacingXXSmall),
                        child: Text(paymentType[index].paymentName,
                            style: Theme.of(context).textTheme.tiniest.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColor.saasifyDarkerGrey)),
                      ),
                      Row(children: [
                        ToggleSwitchWidget(
                            value: paymentType[index].isActive,
                            onChanged: (value) {
                              Map paymentTypeDetailsMap =
                                  paymentType[index].toJson();
                              paymentTypeDetailsMap["is_active"] = value;
                              context.read<PaymentBloc>().add(EditPayment(
                                  paymentDetailsMap: paymentTypeDetailsMap));
                            }),
                        const SizedBox(width: spacingXSmall),
                        PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) =>
                                              AddNewPaymentTypePopup(
                                                  savePaymentDetailsMap:
                                                      paymentType[index]
                                                          .toJson(),
                                                  isEdit: true));
                                    },
                                    child: const Text(StringConstants.kEdit)),
                                PopupMenuItem(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialogueBox(
                                              title: StringConstants.kWarning,
                                              message:
                                                  "Do you want to Delete payment method - ${paymentType[index].paymentName}",
                                              primaryButtonTitle:
                                                  StringConstants.kConfirm,
                                              primaryOnPressed: () {
                                                Navigator.pop(context);
                                                context.read<PaymentBloc>().add(
                                                    DeletePayment(
                                                        paymentId:
                                                            paymentType[index]
                                                                .paymentId));
                                              }));
                                    },
                                    child: const Text(StringConstants.kDelete)),
                              ];
                            },
                            child: const Icon(Icons.more_vert))
                      ]),
                    ])));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: spacingSmall);
      },
    );
  }
}
