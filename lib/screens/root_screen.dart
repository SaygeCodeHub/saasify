import 'package:flutter/material.dart';
import '../widgets/app_bar/mobile_appbar.dart';
import '../widgets/drawer/custom_drawer.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? const CustomDrawer() : null,
      body: isMobile
          ? const SizedBox.shrink()
          : const Row(
              children: [
                CustomDrawer(),
                Expanded(
                  child: Center(
                    child: Text('Main Content'),
                  ),
                ),
              ],
            ),
    );
  }
}
