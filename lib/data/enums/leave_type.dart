enum LeaveTypeEnum {
  warehouse(type: 'Casual Leave', leave_Id: '0'),
  employee(type: 'Medical Leave', leave_Id: '1');

  const LeaveTypeEnum(
      {required this.type, required this.leave_Id});

  final String type;
  final String leave_Id;
}
