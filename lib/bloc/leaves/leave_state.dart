import 'package:saasify/data/models/leaves/apply_leave_model.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';

abstract class LeaveState {}

class LoadApplyLeaveInitial extends LeaveState {}

class LoadingApplyLeaveScreen extends LeaveState {}

class LoadedApplyLeaveScreen extends LeaveState {
  final LoadApplyLeaveScreenModel loadApplyLeaveScreenModel;

  LoadedApplyLeaveScreen({required this.loadApplyLeaveScreenModel});
}

class ErrorLoadingApplyLeaveScreen extends LeaveState {
  final String? message;
  ErrorLoadingApplyLeaveScreen({this.message});
}

class ApplyingLeave extends LeaveState {}

class LeaveApplied extends LeaveState {
  final ApplyLeaveModel applyLeaveModel;

  LeaveApplied({required this.applyLeaveModel});
}

class ApplyLeaveFailed extends LeaveState {
  final String errorMessage;

  ApplyLeaveFailed({required this.errorMessage});
}