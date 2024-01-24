import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/generalModels/value_card_model.dart';
import 'package:saasify/screens/hrms/attendance/attendance_button.dart';
import 'package:saasify/utils/modules.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/generalWidgets/value_card.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class HRMSDashboardScreen extends StatelessWidget {
  static const routeName = 'HRMS';

  const HRMSDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmployee = true;
    List<ValueCardModel> modules = isEmployee ? employeeModules : ownerModules;
    return ScreenSkeleton(
        isHome: true,
        childScreenBuilder: (isMobile) => Padding(
            padding: const EdgeInsets.all(spacingLarge),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        const ModuleHeading(label: 'HRMS'),
                        const SizedBox(height: spacingXSmall),
                        isEmployee?const AttendanceCard(checkInTime: '--:--', checkOutTime: '--:--',):const SizedBox.shrink(),
                        isEmployee?const SizedBox(height: spacingXSmall):const SizedBox.shrink(),
                        GridView.extent(
                            shrinkWrap: true,
                            maxCrossAxisExtent: 250.0,
                            childAspectRatio: isMobile ? 1.4 : 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            children: modules.map((item) {
                              return ValueCard(
                                  cardHeading: item.cardHeading,
                                  value: item.value,
                                  iconPath: item.iconPath,
                                  onTap: () {
                                    item.onTap(context);
                                  });
                            }).toList()),
                      ])),
                )
              ]
            )));
  }
}

class AttendanceCard extends StatelessWidget {
  final String checkInTime;
  final String checkOutTime;
  const AttendanceCard({
    super.key, required this.checkInTime, required this.checkOutTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("Check In",style: Theme.of(context).textTheme.cardMobileHeadingTextStyle),
                    Text(checkInTime)
                  ],
                ),
              ),
              const SizedBox(width: spacingMedium),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("Check Out",style: Theme.of(context).textTheme.cardMobileHeadingTextStyle),
                    Text(checkOutTime)
                  ],
                ),
              ),
              const SizedBox(width: spacingMedium),
              const Expanded(flex: 3,child: AttendanceButton())
            ],
          )
      ),
    );
  }
}
