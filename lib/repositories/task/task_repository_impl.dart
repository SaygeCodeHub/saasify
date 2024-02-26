import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/task/assign_task_model.dart';
import 'package:saasify/data/models/task/get_all_tasks_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/task/task_repository.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

class TaskRepositoryImpl extends TaskRepository {
  final Cache cache = getIt<Cache>();
  @override
  Future<TaskModel> assignTask(Map<String, dynamic> taskDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().post(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.assignTask}",
          taskDetails);
      return TaskModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<TaskModel> editTask(Map<String, dynamic> taskDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().put(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.editTask}",
          taskDetails);
      return TaskModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<TaskModel> updateTaskStatus(
      Map<String, dynamic> updateTaskDetails) async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().put(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.updateTaskStatus}",
          updateTaskDetails);
      return TaskModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetAllTasksModel> getTasks() async {
    try {
      var companyId = await cache.getCompanyId();
      var branchId = await cache.getBranchId();
      var userId = await cache.getUserId();
      final response = await ClientServices().get(
          "${ApiConstants.baseUrl}$companyId/$branchId/$userId/${ApiConstants.getTasks}");
      return GetAllTasksModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
