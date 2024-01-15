import 'package:flutter/cupertino.dart';

import '../data/models/generalModels/value_card_model.dart';

List<ValueCardModel> hrmsModules = [
  const ValueCardModel(
      cardHeading: 'Pending Leave Approvals',
      value: '10',
      iconPath: 'assets/leave.png'),
  const ValueCardModel(
      cardHeading: 'Today’s Absentees',
      value: '3',
      iconPath: 'assets/absence.png'),
  const ValueCardModel(
      cardHeading: 'Total Employees',
      value: '20',
      iconPath: 'assets/employees.png'),
  const ValueCardModel(
      cardHeading: 'Monthly Salary Rollout',
      value: 'Rs. 20,000',
      iconPath: 'assets/wages.png'),
  const ValueCardModel(
      cardHeading: 'Add New Employee', iconPath: 'assets/add_employee.png'),
  ValueCardModel(
      cardHeading: 'View All Employees',
      iconPath: 'assets/employees.png',
      routeName: 'EmployeeListScreen'),
  const ValueCardModel(
      cardHeading: 'HRMS\nConfigurations', iconPath: 'assets/settings.png')
];
