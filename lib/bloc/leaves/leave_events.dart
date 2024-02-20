abstract class LeaveEvents {}

class LoadApplyLeaveScreen extends LeaveEvents {}

class ApplyLeave extends LeaveEvents {
  final Map leaveDetailsMap;

  ApplyLeave({required this.leaveDetailsMap});
}

class GetAllLeaves extends LeaveEvents {}

class UpdateLeaveStatus extends LeaveEvents {
  UpdateLeaveStatus();
}

class WithdrawLeave extends LeaveEvents {
  final int leaveId;

  WithdrawLeave({required this.leaveId});
}
