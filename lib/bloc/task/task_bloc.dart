import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/bloc/task/task_state.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';
import 'package:saasify/data/models/task/assign_task_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/task/task_repository.dart';

class TaskBloc extends Bloc<TaskEvents, TaskStates> {
  final TaskRepository taskRepository = getIt<TaskRepository>();

  Map<String, dynamic> taskDetails = {};

  TaskBloc() : super(TaskInitial()) {
    on<AssignTask>(_onAddTask);
    on<UpdateTaskStatus>(_onUpdateTaskStatus);
  }

  void _onAddTask(AssignTask event, Emitter<TaskStates> emit) async {
    emit(AssigningTask());
    try {
      TaskModel assignTaskModel = event.isEdit
          ? await taskRepository.editTask(taskDetails)
          : await taskRepository.assignTask(taskDetails);
      if (assignTaskModel.status == 200) {
        emit(TaskAssigned());
      } else {
        emit(ErrorAssigningTask(assignTaskModel.message));
      }
    } catch (error) {
      emit(ErrorAssigningTask(error.toString()));
    }
  }

  void _onUpdateTaskStatus(
      UpdateTaskStatus event, Emitter<TaskStates> emit) async {
    emit(UpdatingTaskStatus());
    try {
      Map<String, dynamic> taskDetails = {
        "task_id": event.task.taskId,
        "title": event.task.title,
        "monitored_by": event.task.assignedBy?.id,
        "status": event.status
      };
      TaskModel taskModel = await taskRepository.updateTaskStatus(taskDetails);
      if (taskModel.status == 200) {
        emit(TaskStatusUpdated(taskModel.message));
      } else {
        emit(ErrorUpdatingTaskStatus(taskModel.message));
      }
    } catch (error) {
      emit(ErrorUpdatingTaskStatus(error.toString()));
    }
  }

  setTaskDetails(TasksAssignedMe task) {
    taskDetails["task_id"] = task.taskId;
    taskDetails["title"] = task.title;
    taskDetails["task_description"] = task.taskDescription;
    taskDetails["assigned_to"] = task.assignedTo?.id;
    taskDetails["due_date"] = DateFormat('yyyy-MM-dd').format(task.dueDate);
    taskDetails["priority"] = task.priority;
    taskDetails["monitored_by"] = task.assignedBy?.id;
  }

  resetTaskDetails() {
    taskDetails = {};
  }
}
