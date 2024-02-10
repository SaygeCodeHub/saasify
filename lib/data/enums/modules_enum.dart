enum Modules {
  pendingApprovals(name: 'Pending Approvals', typeId: 1),
  todaysAbsentees(name: 'Today’s Absentees', typeId: 2),
  totalEmployees(name: 'Total Employees', typeId: 3),
  monthlySalaryRollout(name: 'Monthly Salary Rollout', typeId: 4),
  addNewEmployee(name: 'Add New Employee', typeId: 5),
  viewAllEmployees(name: 'View All Employees', typeId: 6),
  hrmsConfigurations(name: 'HRMS Configurations', typeId: 7),
  applyLeave(name: 'Apply Leave', typeId: 8),
  myLeaves(name: 'My Leaves', typeId: 9),
  timesheet(name: 'Timesheet', typeId: 10);

  const Modules({required this.name, required this.typeId});

  final String name;
  final int typeId;
}
