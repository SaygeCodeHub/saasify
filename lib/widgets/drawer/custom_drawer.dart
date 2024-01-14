import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/widgets/drawer/module_list_tile.dart';
import '../../utils/globals.dart';
import '../profile/user_name_widget.dart';
import '../profile/user_profile_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Container(
      color: AppColors.white,
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
                      padding: EdgeInsets.only(left: spacingXXSmall),
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
                : SizedBox(height: MediaQuery.sizeOf(context).height * 0.057),
            const Divider(),
            ModuleListTile(
                iconData: Icons.point_of_sale_outlined,
                title: 'POS',
                onTap: () {
                  Navigator.pushNamed(context, 'POS');
                }),
            ModuleListTile(
                iconData: Icons.supervised_user_circle_sharp,
                title: 'HRMS',
                onTap: () {
                  Navigator.pushNamed(context, HRMSDashboardScreen.routeName);
                }),
            ModuleListTile(
                iconData: Icons.shopping_cart_outlined,
                title: 'Orders',
                onTap: () {
                  Navigator.pushNamed(context, 'Orders');
                }),
            ModuleListTile(
                iconData: Icons.inventory_outlined,
                title: 'Inventory',
                onTap: () {
                  Navigator.pushNamed(context, 'Inventory');
                })
          ],
        ),
      ),
    );
  }
}
