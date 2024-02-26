import 'package:saasify/data/models/task/get_all_tasks_model.dart';

abstract class TaskStates {}

class TaskInitial extends TaskStates {}

class AssigningTask extends TaskStates {}

class TaskAssigned extends TaskStates {}

class ErrorAssigningTask extends TaskStates {
  final String error;
  ErrorAssigningTask(this.error);
}

class UpdatingTaskStatus extends TaskStates {}

class TaskStatusUpdated extends TaskStates {
  final String message;

  TaskStatusUpdated(this.message);
}

class ErrorUpdatingTaskStatus extends TaskStates {
  final String error;
  ErrorUpdatingTaskStatus(this.error);
}

class FetchingAllTasks extends TaskStates {}

class AllTasksFetched extends TaskStates {
  final TaskData tasks;

  AllTasksFetched(this.tasks);
}

class ErrorFetchingAllTasks extends TaskStates {
  final String error;
  ErrorFetchingAllTasks(this.error);
}
