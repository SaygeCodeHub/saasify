import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/coupon/widgets/three_dots_edit_delete.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/toggle_switch_widget.dart';

class CouponListview extends StatelessWidget {
  const CouponListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: kBranchListContainerHeight,
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
                            Text(StringConstants.kCHRISTMAS,
                                style: Theme.of(context)
                                    .textTheme
                                    .tiniest
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.saasifyDarkerGrey)),
                            const SizedBox(height: spacingXSmall),
                            Text(StringConstants.k12OFF,
                                style: Theme.of(context).textTheme.xxTiniest),
                            const SizedBox(height: spacingXXSmall),
                            Text(StringConstants.kMinimumPurchaseOfRs4000,
                                style: Theme.of(context).textTheme.xxTiniest),
                            const SizedBox(height: spacingXSmall),
                            Text(StringConstants.kMinimumPurchaseOfRs8000,
                                style: Theme.of(context).textTheme.xxTiniest)
                          ]),
                      Row(children: [
                        ToggleSwitchWidget(value: true, onChanged: (value) {}),
                        const SizedBox(width: spacingXSmall),
                        const ThreeDotsPopup()
                      ]),
                    ])));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: spacingSmall);
      },
    );
  }
}
