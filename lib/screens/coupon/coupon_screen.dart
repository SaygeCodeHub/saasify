import 'package:flutter/material.dart';
import 'package:saasify/screens/coupon/widgets/coupon_mobile_screen.dart';
import 'package:saasify/screens/coupon/widgets/coupon_web_screen.dart';
import 'package:saasify/utils/responsive.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/sidebar.dart';
import '../../widgets/top_bar.dart';

class CouponScreen extends StatelessWidget {
  static const String routeName = 'DiscountScreen';

  CouponScreen({super.key});

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
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return (constraints.maxWidth < 600)
                        ? const CouponMobileScreen()
                        : const CouponWebScreen();
                  }))
            ]));
  }
}
