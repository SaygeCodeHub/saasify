import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/data/models/employee/add_employee_model.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/get_employee_model.dart';
import 'package:saasify/data/models/employee/invite_employee_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';

class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  Map inviteDetails = {};
  Map<String, dynamic> employeeDetails = {};
  int selectedEmployeeId = -1;
  final EmployeeRepository _employeeRepository = getIt<EmployeeRepository>();

  EmployeeStates get initialState => InitialisingEmployeeStates();

  EmployeeBloc() : super(InitialisingEmployeeStates()) {
    on<InviteEmployee>(_inviteUser);
    on<UpdateEmployee>(_updateEmployee);
    on<GetAllEmployees>(_getAllEmployees);
    on<GetEmployee>(_getEmployee);
    on<DeleteEmployee>(_deleteEmployee);
  }

  FutureOr<void> _inviteUser(
      InviteEmployee event, Emitter<EmployeeStates> emit) async {
    emit(InvitingEmployee());
    try {
      InviteEmployeeModel inviteEmployeeModel =
          await _employeeRepository.inviteEmployee(inviteDetails);
      if (inviteEmployeeModel.status == 200) {
        emit(InvitationSent(inviteEmployeeModel: inviteEmployeeModel));
      } else {
        emit(InvitingFailed(
            errorMessage: inviteEmployeeModel.message.toString()));
      }
    } catch (e) {
      emit(InvitingFailed(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _updateEmployee(
      UpdateEmployee event, Emitter<EmployeeStates> emit) async {
    emit(UpdatingEmployee());
    try {
      UpdateEmployeeModel updateEmployeeModel =
          await _employeeRepository.updateEmployee(employeeDetails,
              selectedEmployeeId == -1 ? "" : selectedEmployeeId.toString());
      if (updateEmployeeModel.status == 200) {
        if (event.isSaveAndNext) {
          selectedEmployeeId = updateEmployeeModel.data.userId ?? -1;
        }
        emit(EmployeeUpdated(
            isSaveAndNext: event.isSaveAndNext,
            message: updateEmployeeModel.message.toString()));
      } else {
        emit(UpdatingEmployeeFailed(
            errorMessage: updateEmployeeModel.message.toString()));
      }
    } catch (e) {
      emit(UpdatingEmployeeFailed(errorMessage: e.toString()));
    }
  }

  void resetEmployeeDetails() {
    employeeDetails = {
      "personal_info": <String, dynamic>{
        "active_status": 1,
      },
      "documents": <String, dynamic>{
        "aadhar": <String, dynamic>{},
        "passport": <String, dynamic>{}
      },
      "financial": <String, dynamic>{
        "finances": <String, dynamic>{},
        "bank_details": <String, dynamic>{}
      },
      "official": <String, dynamic>{
        "designations": [2],
        "department": [0],
      }
    };
    selectedEmployeeId = -1;
  }

  FutureOr<void> _getEmployee(
      GetEmployee event, Emitter<EmployeeStates> emit) async {
    emit(LoadingEmployee());
    try {
      GetEmployeeModel getEmployeeModel =
          await _employeeRepository.getEmployee(event.employeeId.toString());
      if (getEmployeeModel.status == 200) {
        employeeDetails = getEmployeeModel.data;
        selectedEmployeeId = event.employeeId;
        emit(EmployeeLoaded());
      } else {
        emit(LoadingEmployeeFailed(
            errorMessage: getEmployeeModel.message.toString()));
      }
    } catch (e) {
      emit(LoadingEmployeeFailed(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _getAllEmployees(
      GetAllEmployees event, Emitter<EmployeeStates> emit) async {
    emit(LoadingEmployees());
    try {
      GetAllEmployeesModel getAllEmployeesModel =
          await _employeeRepository.getAllEmployees();

      if (getAllEmployeesModel.data.isNotEmpty) {
        emit(EmployeesLoaded(employees: getAllEmployeesModel.data));
      } else {
        emit(LoadingEmployeesFailed(errorMessage: 'No employees found'));
      }
    } catch (e) {
      emit(LoadingEmployeesFailed(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _deleteEmployee(
      DeleteEmployee event, Emitter<EmployeeStates> emit) async {
    emit(DeletingEmployee());
    try {
      var deleteEmployeeModel = await _employeeRepository.deleteEmployee(
          selectedEmployeeId == -1 ? "" : selectedEmployeeId.toString());
      if (deleteEmployeeModel.status == 200) {
        emit(EmployeeDeleted());
      } else {
        emit(DeletingEmployeeFailed(
            errorMessage: deleteEmployeeModel.message.toString()));
      }
    } catch (e) {
      emit(DeletingEmployeeFailed(errorMessage: e.toString()));
    }
  }
}
