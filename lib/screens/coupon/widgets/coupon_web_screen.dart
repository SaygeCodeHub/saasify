import 'package:flutter/material.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../dashboard/dashboard_screen.dart';
import 'add_coupon_pop_up.dart';
import 'coupons_grid.dart';

class CouponWebScreen extends StatelessWidget {
  const CouponWebScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            right: spacingXHuge,
            top: spacingXMedium,
            left: spacingXHuge,
            bottom: spacingXHuge),
        child: Column(children: [
          CustomPageHeader(
            titleText: StringConstants.kCoupons,
            onBack: () {
              Navigator.pushReplacementNamed(
                  context, DashboardsScreen.routeName);
            },
            backIconVisible: true,
            buttonTitle: StringConstants.kAddCoupon,
            buttonVisible: true,
            textFieldVisible: false,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => const AddCouponPopUp(editCoupon: false));
            },
          ),
          const SizedBox(height: spacingStandard),
          const CouponsGrid(),
        ]));
  }
}
