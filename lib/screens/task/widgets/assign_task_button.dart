import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class AssignTaskButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AssignTaskButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: PrimaryButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {}
            },
            buttonTitle: 'Assign'),
      ),
    );
  }
}
