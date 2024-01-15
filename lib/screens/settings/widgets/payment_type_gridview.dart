import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/toggle_switch_widget.dart';
import '../three_dots_popup.dart';

class PaymentTypeGridView extends StatelessWidget {
  const PaymentTypeGridView({
    super.key,
    required this.paymentType,
  });

  final List paymentType;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: spacingStandard,
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
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(paymentType[index]['leading'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .tiniest
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.saasifyDarkGrey)),
                              const SizedBox(height: spacingXMedium),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColor.saasifyLighterGreen),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.circle,
                                            size: 8,
                                            color: AppColor.saasifyGreen),
                                        const SizedBox(width: spacingXSmall),
                                        Text(
                                            StringConstants.kPaymentTypeEnabled,
                                            style: Theme.of(context)
                                                .textTheme
                                                .xxTiniest
                                                .copyWith(
                                                    color:
                                                        AppColor.saasifyGreen))
                                      ]))
                            ]),
                        Row(children: [
                          ToggleSwitchWidget(
                              value: true, onChanged: (value) {}),
                          const SizedBox(width: spacingXSmall),
                          const ThreeDotsPopup()
                        ]),
                      ])));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4,
            crossAxisSpacing: spacingLarge,
            mainAxisSpacing: spacingLarge));
  }
}
