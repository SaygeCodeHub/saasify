import 'dart:convert';

GetAllEmployeesModel getAllEmployeesModelFromJson(String str) =>
    GetAllEmployeesModel.fromJson(json.decode(str));

String getAllEmployeesModelToJson(GetAllEmployeesModel data) =>
    json.encode(data.toJson());

class GetAllEmployeesModel {
  final int status;
  final String message;
  final List<EmployeeDatum> data;

  GetAllEmployeesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllEmployeesModel.fromJson(Map<String, dynamic> json) =>
      GetAllEmployeesModel(
        status: json["status"],
        message: json["message"],
        data: List<EmployeeDatum>.from(
            json["data"].map((x) => EmployeeDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EmployeeDatum {
  final int employeeId;
  final String name;
  final dynamic userContact;
  final List<String> designations;
  final String userEmail;
  final dynamic currentAddress;

  EmployeeDatum({
    required this.employeeId,
    required this.name,
    required this.userContact,
    required this.designations,
    required this.userEmail,
    required this.currentAddress,
  });

  factory EmployeeDatum.fromJson(Map<String, dynamic> json) => EmployeeDatum(
        employeeId: json["employee_id"],
        name: json["name"],
        userContact: json["user_contact"],
        designations: List<String>.from(json["designations"].map((x) => x)),
        userEmail: json["user_email"],
        currentAddress: json["current_address"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "name": name,
        "user_contact": userContact,
        "designations": List<dynamic>.from(designations.map((x) => x)),
        "user_email": userEmail,
        "current_address": currentAddress,
      };
}
