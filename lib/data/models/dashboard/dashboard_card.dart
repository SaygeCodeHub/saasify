import 'package:flutter/material.dart';

class DashboardCardData {
  final IconData iconName;
  final String title;
  final Color iconColor;
  final Color containerColor;
  String subtitle;

  DashboardCardData({
    required this.containerColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.iconName,
  });
}

class DashboardListOptions {
  final IconData iconName;
  final String routeName;
  final String title;
  final Color iconColor;
  final Color containerColor;
  String subtitle;

  DashboardListOptions({
    required this.iconColor,
    required this.containerColor,
    required this.title,
    required this.subtitle,
    required this.routeName,
    required this.iconName,
  });
}
