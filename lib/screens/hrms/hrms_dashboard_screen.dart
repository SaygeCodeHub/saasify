import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_emp_dialouge.dart';
import 'package:saasify/widgets/value_card.dart';
import 'package:saasify/utils/globals.dart';
import '../../../configs/app_spacing.dart';
import '../../../widgets/text/module_heading.dart';
import '../../utils/modules.dart';

class HRMSDashboardScreen extends StatelessWidget {
  const HRMSDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(spacingLarge),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ModuleHeading(label: 'HRMS'),
                const SizedBox(height: spacingXXSmall),
                GridView.extent(
                  shrinkWrap: true,
                  maxCrossAxisExtent: 250.0,
                  childAspectRatio: isMobile ? 1.6 : 1.8,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: hrmsModules.map((item) {
                    return ValueCard(
                      cardHeading: item.cardHeading,
                      value: item.value,
                      iconPath: item.iconPath,
                      onTap: () {
                        showAlertDialog(context);
                      },
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
