import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/data/models/screenArguments/update_employee_screen_arguments.dart';

class EditEmployeeButton extends StatelessWidget {
  const EditEmployeeButton({
    super.key,
    required this.routeName,
    required this.isProfile,
  });

  final String routeName;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, routeName,
              arguments: UpdateEmployeeScreenArguments(isProfile: isProfile));
        },
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.edit_outlined,
            color: AppColors.darkBlue, size: 25));
  }
}
