// UNCOMMENT THIS CODE TO HAVE ACCESS TO ALL THE MODULES
// import 'package:flutter/material.dart';
// import 'package:saasify/configs/app_spacing.dart';
// import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
// import 'package:saasify/screens/inventory/inventory_screen.dart';
// import 'package:saasify/screens/orders/orders_screen.dart';
// import 'package:saasify/widgets/drawer/module_list_tile.dart';
// import '../../utils/globals.dart';
// import '../profile/saasify_logo.dart';
// import '../profile/user_name_widget.dart';
// import '../profile/user_profile_widget.dart';
//
// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
//     return SizedBox(
//       width: isMobile
//           ? MediaQuery.sizeOf(context).width * 0.55
//           : MediaQuery.sizeOf(context).width * 0.15,
//       height: MediaQuery.sizeOf(context).height,
//       child: Drawer(
//         child: ListView(
//           children: <Widget>[
//             isMobile
//                 ? SizedBox(
//               height: MediaQuery.sizeOf(context).height * 0.1,
//               child: const Padding(
//                 padding: EdgeInsets.only(left: spacingXSmall),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     UserProfileWidget(),
//                     SizedBox(width: spacingXMedium),
//                     UserNameWidget()
//                   ],
//                 ),
//               ),
//             )
//                 : SizedBox(
//               height: MediaQuery.sizeOf(context).height * 0.057,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                     left: MediaQuery.sizeOf(context).height * 0.025),
//                 child: const Align(
//                   alignment: Alignment.centerLeft,
//                   child: SaasifyLogo(
//                     width: 30,
//                     height: 30,
//                   ),
//                 ),
//               ),
//             ),
//             const Divider(),
//             ModuleListTile(
//                 iconData: Icons.supervised_user_circle_sharp,
//                 title: 'HRMS',
//                 onTap: () {
//                   Navigator.pushReplacementNamed(
//                       context, HRMSDashboardScreen.routeName);
//                 }),
//             ModuleListTile(
//                 iconData: Icons.point_of_sale_outlined,
//                 title: 'POS',
//                 onTap: () {
//                   Navigator.pushReplacementNamed(context, 'POS');
//                 }),
//             ModuleListTile(
//                 iconData: Icons.shopping_cart_outlined,
//                 title: 'Orders',
//                 onTap: () {
//                   Navigator.pushReplacementNamed(
//                       context, OrdersScreen.routeName);
//                 }),
//             ModuleListTile(
//                 iconData: Icons.inventory_outlined,
//                 title: 'Inventory',
//                 onTap: () {
//                   Navigator.pushReplacementNamed(
//                       context, InventoryScreen.routeName);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/dashboard_route.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/screens/settings/settings_screen.dart';
import 'package:saasify/widgets/drawer/module_list_tile.dart';
import '../../utils/globals.dart';
import '../profile/saasify_logo.dart';
import '../profile/user_name_widget.dart';
import '../profile/user_profile_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return SizedBox(
        width: isMobile
            ? MediaQuery.sizeOf(context).width * 0.55
            : MediaQuery.sizeOf(context).width * 0.15,
        height: MediaQuery.sizeOf(context).height,
        child: FutureBuilder(
            future: getIt<Cache>().getAccessibleModules(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Drawer(
                    child: Column(children: [
                  isMobile
                      ? SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          child: const Padding(
                              padding: EdgeInsets.only(left: spacingXSmall),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    UserProfileWidget(),
                                    SizedBox(width: spacingXMedium),
                                    UserNameWidget()
                                  ])))
                      : SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.057,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.sizeOf(context).height *
                                      0.025),
                              child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: SaasifyLogo(width: 30, height: 30)))),
                  const Divider(),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ModuleListTile(
                            iconData: Icons.supervised_user_circle_sharp,
                            title: snapshot.data![index].title.toString(),
                            onTap: () {
                              DashboardRouting(
                                      featureKey:
                                          snapshot.data![index].moduleKey!,
                                      context: context)
                                  .navigateTo();
                            });
                      }),
                  // ModuleListTile(
                  //     iconData: Icons.settings_outlined,
                  //     title: 'Settings',
                  //     onTap: () {
                  //       Navigator.pushNamed(context, SettingsScreen.routeName,
                  //           arguments: true);
                  //     }),
                  ModuleListTile(
                      iconData: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        getIt<Cache>().clearSharedPreferences();
                        Navigator.pushNamedAndRemoveUntil(context,
                            AuthenticationScreen.routeName, (route) => false);
                      })
                ]));
              } else {
                return const SizedBox.shrink();
              }
            }));
  }
}
