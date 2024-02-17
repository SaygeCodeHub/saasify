import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_emp_dialouge.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_screen.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_screen.dart';
import 'package:saasify/screens/hrms/leaves/getMyLeaves/my_leaves_screen.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_screen.dart';
import 'package:saasify/screens/inventory/inventory_screen.dart';
import 'package:saasify/screens/orders/orders_screen.dart';
import '../screens/hrms/timesheet/timesheet_screen.dart';

class DashboardRouting {
  String featureKey;
  BuildContext context;

  DashboardRouting({required this.featureKey, required this.context});

  void navigateTo() async {
    switch (featureKey) {
      case 'HR':
        Navigator.pushReplacement(
          context,
          buildPageRoute(const HRMSDashboardScreen()),
        );
        break;
      case 'ORDERS':
        Navigator.push(
          context,
          buildPageRoute(const OrdersScreen()),
        );
        break;
      case 'INVENTORY':
        Navigator.push(
          context,
          buildPageRoute(const InventoryScreen()),
        );
        break;
      case 'HR_PENDING_APPROVAL':
        Navigator.push(
          context,
          buildPageRoute(const PendingLeaveRequestScreen()),
        );
        break;
      case 'HR_VIEW_ALL_EMPLOYEES':
        Navigator.push(
          context,
          buildPageRoute(const EmployeeListScreen()),
        );
        break;
      case 'HR_SALARY_ROLLOUT':
        Navigator.push(
          context,
          buildPageRoute(const EmployeeListScreen()),
        );
        break;
      case 'HR_ADD_NEW_EMPLOYEE':
        showAddEmployeeDialog(context);
        break;
      case 'HR_APPLY_LEAVES':
        Navigator.push(
          context,
          buildPageRoute(const ApplyLeaveScreen()),
        );
        break;
      case 'HR_MY_LEAVES':
        Navigator.push(
          context,
          buildPageRoute(const MyLeavesScreen()),
        );
        break;
      case 'HR_TIMESHEET':
        Navigator.push(
          context,
          buildPageRoute(const TimesheetScreen()),
        );
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
