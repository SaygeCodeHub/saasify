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
