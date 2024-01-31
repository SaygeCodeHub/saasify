enum LeaveTypeEnum {
  casual(type: 'Casual Leave', typeId: 0),
  medical(type: 'Medical Leave', typeId: 1);

  const LeaveTypeEnum({required this.type, required this.typeId});

  final String type;
  final int typeId;
}
