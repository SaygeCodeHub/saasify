abstract class LeaveEvent {}

class LoadApplyLeaveScreen extends LeaveEvent {}

class ApplyLeave extends LeaveEvent {
  final Map leaveDetailsMap;

  ApplyLeave({required this.leaveDetailsMap});
}
