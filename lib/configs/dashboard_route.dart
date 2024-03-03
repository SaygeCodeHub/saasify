import 'package:flutter/material.dart';
import 'package:saasify/screens/form/form_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';

class DashboardRouting {
  String featureKey;
  BuildContext context;

  DashboardRouting(
      {required this.featureKey, required this.context});

  void navigateTo() async {
    switch (featureKey) {
      case 'HR':
        Navigator.pushReplacement(
          context,
          buildPageRoute(const HRMSDashboardScreen()),
        );
        break;
      case 'ORDERS':
        break;
      case 'INVENTORY':
        break;
      case 'HR_PENDING_APPROVAL':
        break;
      case 'HR_VIEW_ALL_EMPLOYEES':
        break;
      case 'HR_SALARY_ROLLOUT':
        break;
      case 'HR_ADD_NEW_EMPLOYEE':
        Navigator.pushNamed(context, FormScreen.routeName);
        break;
      case 'HR_APPLY_LEAVES':
        break;
      case 'HR_MY_LEAVES':
        break;
      case 'HR_TIMESHEET':
        break;
    }
  }

  PageRouteBuilder buildPageRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration.zero,
      pageBuilder: (_, __, ___) => page,
    );
  }
}
