import 'package:saasify/data/models/leaves/apply_leave_model.dart';
import 'package:saasify/data/models/leaves/get_all_leaves.dart';
import 'package:saasify/data/models/leaves/load_apply_leave_screen_model.dart';

abstract class LeavesRepository {
  Future<LoadApplyLeaveScreenModel> loadApplyLeaveScreen();

  Future<ApplyLeaveModel> applyLeave(Map leaveDetailsMap);
  Future<GetAllLeavesModel> getAllLeaves();
}
