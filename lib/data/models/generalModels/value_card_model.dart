import 'package:flutter/cupertino.dart';

class ValueCardModel {
  final String cardHeading;
  final String? value;
  final String iconPath;
  final bool? isMobile;
  final void Function(BuildContext context) onTap;
  final String routeName;

  const ValueCardModel({
    required this.onTap,
    this.routeName = '',
    required this.cardHeading,
    this.value = '',
    required this.iconPath,
    this.isMobile = false,
  });
}
