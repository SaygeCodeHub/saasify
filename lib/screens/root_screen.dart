import 'package:flutter/material.dart';
import 'package:saasify/utils/globals.dart';
import '../widgets/app_bar/mobile_appbar.dart';
import '../widgets/drawer/custom_drawer.dart';
import 'new_dashboard/modules/hrms/hrms_dashboard_screen.dart';

class RootScreen extends StatelessWidget {
  static const routeName = 'RootScreen';
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Scaffold(
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? const CustomDrawer() : null,
      body: Row(
        children: [
          isMobile ? const SizedBox() : const CustomDrawer(),
          const Expanded(child: HRMSDashboardScreen())
        ],
      ),
    );
  }
}
