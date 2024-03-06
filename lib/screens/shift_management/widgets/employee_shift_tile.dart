import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class EmployeeShiftTile extends StatelessWidget {
  const EmployeeShiftTile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(spacingSmall),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.centerLeft,
            leading: SvgPicture.asset(
              "assets/svg/user_profile.svg",
              colorFilter:
                  const ColorFilter.mode(AppColors.darkBlue, BlendMode.srcIn),
            ),
            title: const Text("Aditya Rana"),
            children: [
              _buildShiftInfo(context, screenWidth,
                  "1st March 2024 - 15th March 2024", Icons.date_range),
              _buildShiftInfo(context, screenWidth, "8th March, 19th March",
                  Icons.medical_services_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShiftInfo(
      BuildContext context, double screenWidth, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: spacingXXSmall),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: screenWidth * 0.20,
            child: ListTile(
                minLeadingWidth: 10,
                leading: Icon(icon, size: 15, color: AppColors.darkBlue),
                title: Text(title)),
          ),
          if (icon == Icons.medical_services_rounded) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: spacingSmall),
                child: PrimaryButton(
                    onPressed: () {},
                    buttonTitle: "Edit Shift",
                    buttonWidth: screenWidth * 0.050,
                    backgroundColor: AppColors.blue),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
