import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/toggle_switch_widget.dart';
import '../three_dots_popup.dart';

class CouponsGrid extends StatelessWidget {
  const CouponsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
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
                              Text('CHRISTMAS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .tiniest
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.saasifyDarkGrey)),
                              const SizedBox(height: spacingXSmall),
                              Text('12% OFF',
                                  style: Theme.of(context).textTheme.xxTiniest),
                              const SizedBox(height: spacingXXSmall),
                              Text('Minimum purchase of Rs 4000 ',
                                  style: Theme.of(context).textTheme.xxTiniest),
                              const SizedBox(height: spacingXSmall),
                              Text(
                                'Maximum purchase of Rs 8000 ',
                                style: Theme.of(context).textTheme.xxTiniest,
                              )
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
            childAspectRatio: 3.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20));
  }
}
