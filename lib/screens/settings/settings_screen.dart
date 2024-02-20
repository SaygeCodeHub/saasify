import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/settings/settings_bloc.dart';
import 'package:saasify/bloc/settings/settings_events.dart';
import 'package:saasify/bloc/settings/settings_states.dart';
import 'package:saasify/screens/settings/settings_mobile_screen.dart';
import 'package:saasify/screens/settings/settings_web_screen.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

import '../../configs/app_spacing.dart';
import '../../utils/progress_bar.dart';
import '../../widgets/text/module_heading.dart';
import '../hrms/hrms_dashboard_screen.dart';

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
                          child: Row(children: [
                            isMobile
                                ? const SizedBox.shrink()
                                : const BackButton(),
                            const SizedBox(width: spacingXMedium),
                            const ModuleHeading(
                                label: StringConstants.kSettings)
                          ])),
                      Expanded(
                          child: BlocConsumer<SettingsBloc, SettingsState>(
                              listener: (context, state) {
                        if (state is FetchingSettingsFailed) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return ErrorAlertDialog(
                                    description: state.error,
                                    onPressed: () {
                                      Navigator.popUntil(
                                          context, (route) => route.isFirst);
                                    });
                              });
                        }
                        if (state is UpdatingSettings) {
                          ProgressBar.show(context);
                        }
                        if (state is SettingsUpdated) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return SuccessAlertDialog(
                                    description:
                                        state.updateSettingsModel.message,
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context,
                                          HRMSDashboardScreen.routeName);
                                    });
                              });
                        }
                        if (state is UpdateSettingsFailed) {
                          ProgressBar.dismiss(context);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return ErrorAlertDialog(
                                    description: state.error,
                                    onPressed: () {
                                      Navigator.popUntil(
                                          context, (route) => route.isFirst);
                                    });
                              });
                        }
                      }, builder: (context, state) {
                        if (state is FetchingSettings) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is SettingsFetched) {
                          return ResponsiveLayout(
                              mobileBody: SettingsMobileScreen(
                                  settingsData: state.settingsModel.data),
                              desktopBody: SettingsWebScreen(
                                  settingsData: state.settingsModel.data));
                        } else {
                          return const SizedBox.shrink();
                        }
                      }))
                    ])));
  }
}
