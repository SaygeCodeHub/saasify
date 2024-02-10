import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';
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

  navigateTo() async {
    switch (featureKey) {
      case 'HR':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const HRMSDashboardScreen()),
        );
      case 'ORDERS':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const OrdersScreen()),
        );
      case 'INVENTORY':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InventoryScreen()),
        );
      case 'HR_PENDING_APPROVAL':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PendingLeaveRequestScreen()),
        );
      case 'HR_VIEW_ALL_EMPLOYEES':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EmployeeListScreen()),
        );
      case 'HR_SALARY_ROLLOUT':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EmployeeListScreen()),
        );
      case 'HR_ADD_NEW_EMPLOYEE':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddEmployeeScreen()),
        );
      case 'HR_APPLY_LEAVES':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ApplyLeaveScreen()),
        );
      case 'HR_MY_LEAVES':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyLeavesScreen()),
        );
      case 'HR_TIMESHEET':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TimesheetScreen()),
        );
    }
  }
}
