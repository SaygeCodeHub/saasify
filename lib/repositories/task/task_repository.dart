import 'package:saasify/data/models/task/assign_task_model.dart';
import 'package:saasify/data/models/task/get_all_tasks_model.dart';

abstract class TaskRepository {
  Future<TaskModel> assignTask(Map<String, dynamic> taskDetails);
  Future<TaskModel> editTask(Map<String, dynamic> taskDetails);
  Future<TaskModel> updateTaskStatus(Map<String, dynamic> updateTaskDetails);
  Future<GetAllTasksModel> getTasks();
}
