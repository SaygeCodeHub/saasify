import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saasify/bloc/authentication/authentication_bloc.dart';
import 'package:saasify/bloc/authentication/authentication_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/database/database_util.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/inventory/inventory_list_screen.dart';
import 'package:saasify/screens/onboarding/auhentication_screen.dart';
import 'package:saasify/screens/orders/orders_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen.dart';
import 'package:saasify/screens/product/product_list_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../screens/categories/categories_screen.dart';

class SideBar extends StatelessWidget {
  static String userName = '';
  static int userContact = 0;
  final int selectedIndex;

  const SideBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColor.saasifyWhite,
        surfaceTintColor: AppColor.saasifyTransparent,
        elevation: 4,
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(spacingMedium),
              child: Row(children: [
                SvgPicture.asset("assets/Profile.svg", height: 70),
                const SizedBox(width: spacingXXSmall),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(userName,
                          style: Theme.of(context).textTheme.xTiniest.copyWith(
                              color: AppColor.saasifyLighterBlack,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: spacingXXSmall),
                      Text(userContact.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .xxxTiniest
                              .copyWith(
                                  color: AppColor.saasifyLighterBlack,
                                  fontWeight: FontWeight.w300))
                    ])
              ])),
          const Divider(),
          const SizedBox(height: spacingMedium),
          Padding(
              padding: const EdgeInsets.only(left: spacingLarge),
              child: Column(children: [
                ListTile(
                  title: Text(StringConstants.kDashboard,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 1)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightBlack,
                          fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, DashboardsScreen.routeName);
                  },
                ),
                ListTile(
                  title: Text(StringConstants.kPOS,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 2)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightBlack,
                          fontWeight: FontWeight.w600)),
                  onTap: () async {
                    await DatabaseUtil.products.clear();
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                          context, POSScreen.routeName);
                    }
                  },
                ),
                ListTile(
                  title: Text(StringConstants.kProducts,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 3)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightBlack,
                          fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ProductListScreen.routeName);
                  },
                ),

                ListTile(
                  title: Text(StringConstants.kCategories,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 4)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightBlack,
                          fontWeight: FontWeight.w600)),
                  onTap: () async {
                    await DatabaseUtil.products.clear();
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                          context, CategoriesScreen.routeName);
                    }
                  },
                ),
                ListTile(
                  title: Text(StringConstants.kOrders,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 5)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightBlack,
                          fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, OrdersScreen.routeName);
                  },
                ),
                ListTile(
                  title: Text(StringConstants.kInventoryManagement,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: (selectedIndex == 6)
                              ? AppColor.saasifyLightDeepBlue
                              : AppColor.saasifyLightBlack,
                          fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, InventoryListScreen.routeName);
                  },
                ),
                // ListTile(
                //   title: Text('Profile Management',
                //       style: Theme.of(context).textTheme.xxxTiniest.copyWith(
                //           color: (selectedIndex == 6)
                //               ? AppColor.saasifyLightDeepBlue
                //               : AppColor.saasifyBlack)),
                //   onTap: () {},
                // ),
                // ListTile(
                //   title: Text('Insights',
                //       style: Theme.of(context).textTheme.xxxTiniest.copyWith(
                //           color: (selectedIndex == 7)
                //               ? AppColor.saasifyLightDeepBlue
                //               : AppColor.saasifyBlack)),
                //   onTap: () {},
                // )
              ])),
          const Divider(),
          Padding(
              padding: const EdgeInsets.only(left: spacingLarge),
              child: ListTile(
                title: Text(StringConstants.kLogout,
                    style: Theme.of(context).textTheme.xTiniest.copyWith(
                        color: AppColor.saasifyRed,
                        fontWeight: FontWeight.w600)),
                onTap: () {
                  context.read<AuthenticationBloc>().add(LogOut());
                  Navigator.pushNamedAndRemoveUntil(context,
                      AuthenticationScreen.routeName, (route) => false);
                },
              ))
        ]));
  }
}
