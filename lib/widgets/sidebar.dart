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
import 'package:saasify/screens/authentication/auhentication_screen.dart';
import 'package:saasify/screens/orders/orders_screen.dart';
import 'package:saasify/screens/pos_new/pos_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../configs/app_dimensions.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/product/product_screen.dart';
import '../screens/purchase_order/purchase_order_screen.dart';

class SideBar extends StatelessWidget {
  static String userName = '';
  static int userContact = 0;
  final int selectedIndex;

  const SideBar({super.key, required this.selectedIndex});

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
              padding: const EdgeInsets.only(
                  left: spacingMedium, right: spacingMedium),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(spacingXSmall)),
                      color: (selectedIndex == 1)
                          ? AppColor.saasifySkyBlue
                          : null),
                  child: ListTile(
                      leading: Icon(
                        Icons.dashboard_outlined,
                        size: kSideBarLeadingIconsSize,
                        color: (selectedIndex == 1)
                            ? AppColor.saasifyBlue
                            : AppColor.saasifyLightBlack,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(StringConstants.kDashboard,
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
                                .copyWith(
                                    color: (selectedIndex == 1)
                                        ? AppColor.saasifyBlue
                                        : AppColor.saasifyLightBlack,
                                    fontWeight: FontWeight.w600)),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, DashboardsScreen.routeName);
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(spacingXSmall)),
                      color: (selectedIndex == 2)
                          ? AppColor.saasifySkyBlue
                          : null),
                  child: ListTile(
                      leading: Icon(
                        Icons.point_of_sale_outlined,
                        size: kSideBarLeadingIconsSize,
                        color: (selectedIndex == 2)
                            ? AppColor.saasifyBlue
                            : AppColor.saasifyLightBlack,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(StringConstants.kPOS,
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
                                .copyWith(
                                    color: (selectedIndex == 2)
                                        ? AppColor.saasifyBlue
                                        : AppColor.saasifyLightBlack,
                                    fontWeight: FontWeight.w600)),
                      ),
                      onTap: () async {
                        await DatabaseUtil.products.clear();
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(
                              context, POSScreen.routeName);
                        }
                      }),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(spacingXSmall)),
                        color: (selectedIndex == 3)
                            ? AppColor.saasifySkyBlue
                            : null),
                    child: ListTile(
                        leading: Icon(
                          Icons.production_quantity_limits,
                          size: kSideBarLeadingIconsSize,
                          color: (selectedIndex == 3)
                              ? AppColor.saasifyBlue
                              : AppColor.saasifyLightBlack,
                        ),
                        title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(StringConstants.kProducts,
                                style: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(
                                        color: (selectedIndex == 3)
                                            ? AppColor.saasifyBlue
                                            : AppColor.saasifyLightBlack,
                                        fontWeight: FontWeight.w600))),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, ProductScreen.routeName);
                        })),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(spacingXSmall)),
                      color: (selectedIndex == 4)
                          ? AppColor.saasifySkyBlue
                          : null),
                  child: ListTile(
                      leading: Icon(
                        Icons.category_outlined,
                        size: kSideBarLeadingIconsSize,
                        color: (selectedIndex == 4)
                            ? AppColor.saasifyBlue
                            : AppColor.saasifyLightBlack,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(StringConstants.kCategories,
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
                                .copyWith(
                                    color: (selectedIndex == 4)
                                        ? AppColor.saasifyBlue
                                        : AppColor.saasifyLightBlack,
                                    fontWeight: FontWeight.w600)),
                      ),
                      onTap: () async {
                        await DatabaseUtil.products.clear();
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(
                              context, CategoriesScreen.routeName);
                        }
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(spacingXSmall)),
                      color: (selectedIndex == 5)
                          ? AppColor.saasifySkyBlue
                          : null),
                  child: ListTile(
                      leading: Icon(
                        Icons.history_edu_outlined,
                        size: kSideBarLeadingIconsSize,
                        color: (selectedIndex == 5)
                            ? AppColor.saasifyBlue
                            : AppColor.saasifyLightBlack,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(StringConstants.kOrders,
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
                                .copyWith(
                                    color: (selectedIndex == 5)
                                        ? AppColor.saasifyBlue
                                        : AppColor.saasifyLightBlack,
                                    fontWeight: FontWeight.w600)),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, OrdersScreen.routeName);
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(spacingXSmall)),
                      color: (selectedIndex == 6)
                          ? AppColor.saasifySkyBlue
                          : null),
                  child: ListTile(
                      leading: Icon(
                        Icons.shopping_cart_outlined,
                        size: kSideBarLeadingIconsSize,
                        color: (selectedIndex == 6)
                            ? AppColor.saasifyBlue
                            : AppColor.saasifyLightBlack,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(StringConstants.kPurchaseOrderSmall,
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
                                .copyWith(
                                    color: (selectedIndex == 6)
                                        ? AppColor.saasifyBlue
                                        : AppColor.saasifyLightBlack,
                                    fontWeight: FontWeight.w600)),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, PurchaseOrder.routeName);
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(spacingXSmall)),
                      color: (selectedIndex == 7)
                          ? AppColor.saasifySkyBlue
                          : null),
                  child: ListTile(
                      leading: Icon(
                        Icons.inventory_outlined,
                        size: kSideBarLeadingIconsSize,
                        color: (selectedIndex == 7)
                            ? AppColor.saasifyBlue
                            : AppColor.saasifyLightBlack,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Text(StringConstants.kInventoryManagement,
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
                                .copyWith(
                                    color: (selectedIndex == 7)
                                        ? AppColor.saasifyBlue
                                        : AppColor.saasifyLightBlack,
                                    fontWeight: FontWeight.w600)),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, InventoryListScreen.routeName);
                      }),
                )
              ])),
          const Divider(),
          Padding(
              padding: const EdgeInsets.only(left: spacingLarge),
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  size: kSideBarLeadingIconsSize,
                  color: AppColor.saasifyRed,
                ),
                title: Transform.translate(
                  offset: const Offset(-20, 0),
                  child: Text(StringConstants.kLogout,
                      style: Theme.of(context).textTheme.xTiniest.copyWith(
                          color: AppColor.saasifyRed,
                          fontWeight: FontWeight.w600)),
                ),
                onTap: () {
                  context.read<AuthenticationBloc>().add(LogOut());
                  Navigator.pushNamedAndRemoveUntil(context,
                      AuthenticationScreen.routeName, (route) => false);
                },
              ))
        ]));
  }
}
