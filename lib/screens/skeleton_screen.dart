import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/utils/globals.dart';
import '../widgets/app_bar/mobile_appbar.dart';
import '../widgets/app_bar/web_appbar.dart';
import '../widgets/drawer/custom_drawer.dart';

class SkeletonScreen extends StatelessWidget {
  static const routeName = 'RootScreen';

  const SkeletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Scaffold(
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? const CustomDrawer() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isMobile ? const SizedBox() : const CustomDrawer(),
          Expanded(
            child: Column(
              children: [
                isMobile ? const SizedBox() : const WebAppBar(),
                const Expanded(child: HRMSDashboardScreen()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
