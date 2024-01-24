import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/generalModels/value_card_model.dart';
import 'package:saasify/screens/hrms/attendance/attendance_button.dart';
import 'package:saasify/screens/hrms/attendance/attendance_card.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: spacingLarge),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isEmployee
                      ? const AttendanceCard(
                          checkInTime: null, checkOutTime: null)
                      : const SizedBox.shrink(),
                  isEmployee
                      ? const SizedBox(height: spacingXSmall)
                      : const SizedBox.shrink(),
                  const ModuleHeading(label: 'HRMS'),
                  const SizedBox(height: spacingXSmall),
                  Expanded(
                    child: SingleChildScrollView(
                      child: GridView.extent(
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
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: spacingLarge),
                    child: Center(child: AttendanceButton()),
                  )
                ])));
  }
}
