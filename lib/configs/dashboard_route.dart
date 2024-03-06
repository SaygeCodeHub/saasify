import 'package:flutter/material.dart';
import 'package:saasify/screens/dashboard/dashboard_screen.dart';
import 'package:saasify/screens/form/form_screen.dart';

class DashboardRouting {
  String featureKey;
  BuildContext context;
  String? endpoint;

  DashboardRouting(
      {required this.featureKey, this.endpoint, required this.context});

  void navigateTo() async {
    switch (featureKey) {
      case 'HR':
        Navigator.pushReplacement(
          context,
          buildPageRoute(const DashboardScreen()),
        );
        break;
      case 'ORDERS':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'INVENTORY':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_PENDING_APPROVAL':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_TASK_MANAGEMENT':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_VIEW_ALL_EMPLOYEES':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_SALARY_ROLLOUT':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_ADD_NEW_EMPLOYEE':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_APPLY_LEAVES':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_MY_LEAVES':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      case 'HR_TIMESHEET':
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
        break;
      default:
        Navigator.pushNamed(context, FormScreen.routeName,
            arguments: endpoint ?? '');
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
