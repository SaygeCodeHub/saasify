import 'package:flutter/material.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../../widgets/primary_button.dart';
import '../../dashboard/dashboard_screen.dart';
import 'add_coupon_pop_up.dart';
import 'coupon_listview.dart';

class CouponMobileScreen extends StatelessWidget {
  const CouponMobileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(spacingLarge),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularRadius),
                  boxShadow: const [
                    BoxShadow(
                        color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                  ],
                  color: AppColor.saasifyWhite),
              child: PrimaryButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) =>
                            const AddCouponPopUp(editCoupon: false));
                  },
                  buttonTitle: StringConstants.kAddCoupon))),
      body: Padding(
          padding: const EdgeInsets.all(spacingLarge),
          child: Column(children: [
            CustomPageHeader(
              titleText: StringConstants.kCoupons,
              onBack: () {
                Navigator.pushReplacementNamed(
                    context, DashboardsScreen.routeName);
              },
              backIconVisible: true,
              buttonVisible: false,
              textFieldVisible: false,
            ),
            const SizedBox(height: spacingStandard),
            const CouponListview(),
          ])),
    );
  }
}
