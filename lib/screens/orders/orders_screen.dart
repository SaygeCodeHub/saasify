import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/orders/orders_screen_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'OrdersScreen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSkeleton(
          childScreenBuilder: (bool isMobile) => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: spacingMedium),
                  Padding(
                    padding: EdgeInsets.only(
                        left: spacingMedium, right: spacingMedium),
                    child: ModuleHeading(label: 'Orders'),
                  ),
                  Expanded(
                    child: ResponsiveLayout(
                        mobileBody: OrdersScreenWeb(),
                        desktopBody: OrdersScreenWeb()),
                  )
                  // BlocBuilder<SettingsBloc, SettingsState>(
                  //     builder: (context, state) {
                  //       if (state is FetchingSettings) {
                  //         return const Center(child: CircularProgressIndicator());
                  //       } else if (state is SettingsFetched) {
                  //         return const ResponsiveLayout(
                  //             mobileBody: SettingsMobileScreen(),
                  //             desktopBody: SettingsWebScreen());
                  //       } else {
                  //         return const SizedBox.shrink();
                  //       }
                  //     })
                ],
              )),
    );
  }
}
