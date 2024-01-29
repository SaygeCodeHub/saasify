import '../../data/models/leaves/load_apply_leave_model.dart';

abstract class LoadApplyLeaveState {}

class LoadApplyLeaveInitial extends LoadApplyLeaveState {}

class LoadingApplyLeave extends LoadApplyLeaveState {}

class LoadedApplyLeave extends LoadApplyLeaveState {
  final LoadApplyLeaveModel loadApplyLeaveModel;

  LoadedApplyLeave({required this.loadApplyLeaveModel});
}

class ErrorLoadingApplyLeave extends LoadApplyLeaveState {
  final String? message;
  ErrorLoadingApplyLeave({this.message});
}