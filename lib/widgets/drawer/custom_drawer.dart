import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/widgets/drawer/module_list_tile.dart';
import '../../utils/globals.dart';
import '../profile/saasifyLogo.dart';
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
      child: Drawer(
        child: ListView(
          children: <Widget>[
            isMobile
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    child: const Padding(
                      padding: EdgeInsets.only(left: spacingXSmall),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserProfileWidget(size: spacingExcel),
                          SizedBox(width: spacingXMedium),
                          UserNameWidget()
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.057,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).height * 0.025),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: SaasifyLogo(
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
            const Divider(),
            ModuleListTile(
                iconData: Icons.point_of_sale_outlined,
                title: 'POS',
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'POS');
                }),
            ModuleListTile(
                iconData: Icons.supervised_user_circle_sharp,
                title: 'HRMS',
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, HRMSDashboardScreen.routeName);
                }),
            ModuleListTile(
                iconData: Icons.shopping_cart_outlined,
                title: 'Orders',
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'Orders');
                }),
            ModuleListTile(
                iconData: Icons.inventory_outlined,
                title: 'Inventory',
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'Inventory');
                })
          ],
        ),
      ),
    );
  }
}
