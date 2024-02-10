import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/inventory/inventory_screen_web.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class InventoryScreen extends StatelessWidget {
  static const routeName = 'InventoryScreen';
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSkeleton(
          childScreenBuilder: (bool isMobile) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: spacingMedium),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: spacingMedium, right: spacingMedium),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ModuleHeading(label: 'Inventory'),
                        PrimaryButton(
                          onPressed: () {},
                          buttonTitle: 'Add new product',
                          buttonWidth: spacingLarger,
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: ResponsiveLayout(
                        mobileBody: InventoryScreenWeb(),
                        desktopBody: InventoryScreenWeb()),
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
