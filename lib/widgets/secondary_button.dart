import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/new_app_theme.dart';
import '../configs/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? buttonWidth;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final BorderSide? side;
  final String buttonTitle;
  final IconData? icon;

  const SecondaryButton(
      {super.key,
      required this.onPressed,
      this.buttonWidth,
      this.style,
      this.backgroundColor,
      this.side,
      required this.buttonTitle,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCircularRadius)),
            backgroundColor: AppColors.white,
            side: (side == null)
                ? const BorderSide(color: AppColors.black)
                : side,
            minimumSize: Size(buttonWidth ?? double.maxFinite, 50)),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (icon == null) ? const SizedBox.shrink() : Icon(icon),
              Text(buttonTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.buttonTextStyle.copyWith(
                      color: AppColors.black)),
            ]));
  }
}
