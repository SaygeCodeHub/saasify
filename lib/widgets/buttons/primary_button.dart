import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_dimensions.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final BorderSide? side;
  final String buttonTitle;
  final IconData? icon;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;

  const PrimaryButton(
      {super.key,
      required this.onPressed,
      this.buttonWidth,
      this.style,
      this.backgroundColor,
      this.side,
      required this.buttonTitle,
      this.icon,
      this.shape,
      this.buttonHeight,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kCircularRadius)),
          backgroundColor: backgroundColor ?? AppColors.orange,
          minimumSize:
              Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50)),
      child: FittedBox(
          child: Text(buttonTitle,
              textAlign: TextAlign.center,
              style: (textStyle != null)
                  ? textStyle
                  : Theme.of(context).textTheme.labelTextStyle.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w700))),
    );
  }
}
