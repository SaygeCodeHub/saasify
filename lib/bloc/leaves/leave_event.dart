abstract class LeaveEvents {}

class LoadApplyLeaveScreen extends LeaveEvents {}

class ApplyLeave extends LeaveEvents {
  final Map leaveDetailsMap;

  ApplyLeave({required this.leaveDetailsMap});
}

class GetAllLeaves extends LeaveEvents {}

