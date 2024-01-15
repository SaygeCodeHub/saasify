import 'package:flutter/material.dart';
import 'package:saasify/screens/settings/widgets/add_coupon_pop_up.dart';
import 'package:saasify/screens/settings/widgets/coupons_grid.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/custom_page_header.dart';
import '../../configs/app_spacing.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';
import '../dashboard/dashboard_screen.dart';

class DiscountScreen extends StatelessWidget {
  static const String routeName = 'DiscountScreen';

  DiscountScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const SideBar(selectedIndex: 1),
        body: Flex(
            direction:
                context.responsive(Axis.vertical, desktop: Axis.horizontal),
            children: [
              context.responsive(
                  TopBar(
                      scaffoldKey: _scaffoldKey,
                      headingText: StringConstants.kCoupons),
                  desktop: const Expanded(child: SideBar(selectedIndex: 1))),
              Expanded(
                  flex: 5,
                  child: Padding(
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
                                builder: (ctx) => const AddCouponPopUp());
                          },
                        ),
                        const SizedBox(height: spacingStandard),
                        const CouponsGrid(),
                      ])))
            ]));
  }
}
