import '../../data/models/leaves/load_apply_leave_model.dart';

abstract class LeavesRepository {
  Future<LoadApplyLeaveModel> loadApplyLeave();
}