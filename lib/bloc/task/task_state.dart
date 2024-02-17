abstract class TaskStates {}

class TaskInitial extends TaskStates {}

class AssigningTask extends TaskStates {}

class TaskAssigned extends TaskStates {}

class ErrorAssigningTask extends TaskStates {
  final String error;
  ErrorAssigningTask(this.error);
}
