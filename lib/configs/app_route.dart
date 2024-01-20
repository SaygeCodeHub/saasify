import 'package:flutter/material.dart';
import 'package:saasify/screens/authentication/register_screen.dart';
import 'package:saasify/screens/companies/all_branches_screen.dart';
import 'package:saasify/screens/companies/all_companies_screen.dart';
import 'package:saasify/screens/generalScreens/coming_soon_screen.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/screens/settings/settings_screen.dart';
import '../screens/authentication/auhentication_screen.dart';
import '../screens/authentication/forgot_password_screen.dart';
import '../screens/companies/add_company_screen.dart';
import '../screens/hrms/add_employee/add_employee_screen.dart';
import '../screens/hrms/leaves/apply_and_leave_detail_screen.dart';

class AppRoutes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case AuthenticationScreen.routeName:
        return _createRoute(AuthenticationScreen());
      case RegisterScreen.routeName:
        return _createRoute(const RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return _createRoute(const ForgotPasswordScreen());
      case AddCompanyScreen.routeName:
        return _createRoute(const AddCompanyScreen());
      case HRMSDashboardScreen.routeName:
        return _createRoute(const HRMSDashboardScreen());
      case EmployeeListScreen.routeName:
        return _createRoute(const EmployeeListScreen());
      case AddEmployeeScreen.routeName:
        return _createRoute(const AddEmployeeScreen());
      case ApplyAndLeaveDetailScreen.routeName:
        return _createRoute(const ApplyAndLeaveDetailScreen());
      case AllCompaniesScreen.routeName:
        return _createRoute(AllCompaniesScreen());
      case AllBranchesScreen.routeName:
        return _createRoute(AllBranchesScreen(companyName: settings.arguments as String));
      case SettingsScreen.routeName:
        return _createRoute(const SettingsScreen());
      default:
        return _createRoute(const ComingSoonScreen());
    }
  }

  static Route<dynamic> _createRoute(Widget view) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}
