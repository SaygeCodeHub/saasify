import 'package:saasify/data/models/leaves/apply_leave_model.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';

abstract class LeaveStates {}

class LoadLeaveInitialise extends LeaveStates {}

class LoadingApplyLeaveScreen extends LeaveStates {}

class ApplyLeaveScreenLoaded extends LeaveStates {
  final LoadApplyLeaveScreenModel loadApplyLeaveScreenModel;

  ApplyLeaveScreenLoaded({required this.loadApplyLeaveScreenModel});
}

class ErrorLoadingApplyLeaveScreen extends LeaveStates {
  final String? message;
  ErrorLoadingApplyLeaveScreen({this.message});
}

class ApplyingLeave extends LeaveStates {}

class LeaveApplied extends LeaveStates {
  final ApplyLeaveModel applyLeaveModel;

  LeaveApplied({required this.applyLeaveModel});
}

class ApplyLeaveFailed extends LeaveStates {
  final String errorMessage;

  ApplyLeaveFailed({required this.errorMessage});
}

