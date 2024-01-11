import 'package:flutter/material.dart';

import '../widgets/app_bar/mobile_appbar.dart';
import '../widgets/drawer/mobile_drawer.dart';
import '../widgets/drawer/web_drawer.dart';

class ERPDashboardScreen extends StatelessWidget {
  const ERPDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? const MobileDrawer() : null,
      body: isMobile
          ? const SizedBox.shrink()
          : Row(
              children: [
                const WebDrawer(),
                Expanded(
                  child: Container(
                    // Your main content goes here
                    child: const Center(
                      child: Text('Main Content'),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
