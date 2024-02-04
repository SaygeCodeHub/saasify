import 'package:flutter/cupertino.dart';

class ValueCardModel {
  final String cardHeading;
  final String? value;
  final IconData iconData;
  final bool? isMobile;
  final void Function(BuildContext context) onTap;

  const ValueCardModel({
    required this.onTap,
    required this.cardHeading,
    this.value = '',
    required this.iconData,
    this.isMobile = false,
  });
}
