import 'package:saasify/data/models/task/assign_task_model.dart';

abstract class TaskRepository {
  Future<AssignTaskModel> assignTask(Map<String, dynamic> taskDetails);
}
