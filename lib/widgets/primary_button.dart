import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? buttonWidth;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final BorderSide? side;
  final String buttonTitle;
  final IconData? icon;
  final OutlinedBorder? shape;

  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      this.buttonWidth,
      this.style,
      this.backgroundColor,
      this.side,
      required this.buttonTitle,
      this.icon,
      this.shape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kCircularRadius)),
          backgroundColor: backgroundColor ?? AppColor.saasifyLightDeepBlue,
          minimumSize: Size(buttonWidth ?? double.maxFinite, 50)),
      child: FittedBox(
          child: Text(buttonTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.xTiniest.copyWith(
                  color: AppColor.saasifyWhite, fontWeight: FontWeight.w700))),
    );
  }
}
