import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_bloc.dart';
import 'package:saasify/bloc/settings/settings_events.dart';
import 'package:saasify/bloc/settings/settings_states.dart';
import 'package:saasify/screens/settings/settings_mobile_screen.dart';
import 'package:saasify/screens/settings/settings_web_screen.dart';
import 'package:saasify/screens/settings/widgets/edit_settings_button.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

import '../../configs/app_spacing.dart';
import '../../widgets/text/module_heading.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'SettingsScreen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SettingsBloc>().add(GetAllSettings());
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const BackButton(),
                        const SizedBox(width: spacingXMedium),
                        const ModuleHeading(label: 'Settings'),
                        const Spacer(),
                        EditSettingsButton(
                          buttonTitle: 'Edit',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) {
                    if (state is FetchingSettings) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SettingsFetched) {
                      return const ResponsiveLayout(
                          mobileBody: SettingsMobileScreen(),
                          desktopBody: SettingsWebScreen());
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
                ],
              )),
    );
  }
}
