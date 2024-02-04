import 'package:flutter/cupertino.dart';
import 'package:saasify/data/enums/modules_enum.dart';
import 'package:saasify/data/models/generalModels/value_card_model.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_emp_dialouge.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_screen.dart';
import 'package:saasify/screens/hrms/leaves/applyLeave/apply_leave_screen.dart';
import 'package:saasify/screens/hrms/leaves/getMyLeaves/my_leaves_screen.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/pending_leave_request_screen.dart';

List<ValueCardModel> statisticsModules = [
  ValueCardModel(
      cardHeading: Modules.pendingLeaveApprovals.name,
      value: '10',
      iconPath: 'assets/leave.png',
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, PendingLeaveRequestScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.todaysAbsentees.name,
      value: '3',
      iconPath: 'assets/absence.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: Modules.totalEmployees.name,
      value: '20',
      iconPath: 'assets/employees.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: Modules.monthlySalaryRollout.name,
      value: 'Rs. 20,000',
      iconPath: 'assets/wages.png',
      onTap: (BuildContext context) {}),
];
List<ValueCardModel> hrmsModules = [
  ValueCardModel(
      cardHeading: Modules.addNewEmployee.name,
      iconPath: 'assets/add_employee.png',
      onTap: (context) {
        showAddEmployeeDialog(context);
      }),
  ValueCardModel(
      cardHeading: Modules.viewAllEmployees.name,
      iconPath: 'assets/employees.png',
      onTap: (context) {
        Navigator.pushNamed(context, EmployeeListScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.hrmsConfigurations.name,
      iconPath: 'assets/settings.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: Modules.applyLeave.name,
      iconPath: 'assets/documents.png',
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, ApplyLeaveScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.myLeaves.name,
      iconPath: 'assets/holiday.png',
      onTap: (BuildContext context) {
        Navigator.pushNamed(context, MyLeavesScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: Modules.timesheet.name,
      iconPath: 'assets/attendant-history.png',
      onTap: (BuildContext context) {})
];
