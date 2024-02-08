import 'package:flutter/cupertino.dart';

class ValueCardModel {
  final String cardHeading;
  final String? value;
  final IconData iconData;
  final bool? isMobile;
  final double? moduleId;
  final void Function(BuildContext context) onTap;

  const ValueCardModel({
    required this.onTap,
    required this.cardHeading,
    this.value = '',
    required this.iconData,
    required this.moduleId,
    this.isMobile = false,
  });
}
