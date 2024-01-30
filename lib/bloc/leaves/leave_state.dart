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