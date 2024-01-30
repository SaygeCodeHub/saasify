enum LeaveTypeEnum {
  warehouse(type: 'Casual Leave', typeId: '0'),
  employee(type: 'Medical Leave', typeId: '1');

  const LeaveTypeEnum(
      {required this.type, required this.typeId});

  final String type;
  final String typeId;
}