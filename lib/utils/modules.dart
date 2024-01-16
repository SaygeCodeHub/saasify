import 'package:flutter/cupertino.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_emp_dialouge.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_screen.dart';

import '../data/models/generalModels/value_card_model.dart';

List<ValueCardModel> hrmsModules = [
  ValueCardModel(
      cardHeading: 'Pending Leave Approvals',
      value: '10',
      iconPath: 'assets/leave.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'Today’s Absentees',
      value: '3',
      iconPath: 'assets/absence.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'Total Employees',
      value: '20',
      iconPath: 'assets/employees.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'Monthly Salary Rollout',
      value: 'Rs. 20,000',
      iconPath: 'assets/wages.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'Add New Employee',
      iconPath: 'assets/add_employee.png',
      onTap: (context) {
        showAddEmployeeDialog(context);
      }),
  ValueCardModel(
      cardHeading: 'View All Employees',
      iconPath: 'assets/employees.png',
      onTap: (context) {
        Navigator.pushNamed(context, EmployeeListScreen.routeName);
      }),
  ValueCardModel(
      cardHeading: 'HRMS\nConfigurations',
      iconPath: 'assets/settings.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'Apply Leave',
      iconPath: 'assets/documents.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'My Leaves',
      iconPath: 'assets/holiday.png',
      onTap: (BuildContext context) {}),
  ValueCardModel(
      cardHeading: 'Timesheet',
      iconPath: 'assets/attendant-history.png',
      onTap: (BuildContext context) {}),
];
