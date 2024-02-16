import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/task/task_event.dart';
import 'package:saasify/bloc/task/task_state.dart';
import 'package:saasify/data/models/task/assign_task_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/task/task_repository.dart';

class TaskBloc extends Bloc<TaskEvents, TaskStates> {
  final TaskRepository taskRepository = getIt<TaskRepository>();

  Map<String, dynamic> taskDetails = {};

  TaskBloc() : super(TaskInitial()) {
    on<AssignTask>(_onAddTask);
  }

  void _onAddTask(AssignTask event, Emitter<TaskStates> emit) async {
    emit(AssigningTask());
    try {
      AssignTaskModel assignTaskModel =
          await taskRepository.assignTask(taskDetails);
      if (assignTaskModel.status == 200) {
        emit(TaskAssigned());
      } else {
        emit(ErrorAssigningTask(assignTaskModel.message));
      }
    } catch (error) {
      emit(ErrorAssigningTask(error.toString()));
    }
  }
}
