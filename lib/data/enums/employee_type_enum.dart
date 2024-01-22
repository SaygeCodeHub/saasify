enum EmployeeType {
  owner(type: "Owner", typeId: 0),
  manager(type: "Manager", typeId: 1),
  employee(type: "Employee", typeId: 2),
  accountant(type: "Accountant", typeId: 3);

  const EmployeeType({required this.type, required this.typeId});

  final String type;
  final int typeId;
}
