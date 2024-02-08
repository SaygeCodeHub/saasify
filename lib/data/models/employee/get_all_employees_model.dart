import 'dart:convert';

GetAllEmployeesModel getAllEmployeesModelFromJson(String str) {
  if (str.isEmpty) {
    throw ArgumentError("Input string cannot be null or empty.");
  }
  return GetAllEmployeesModel.fromJson(json.decode(str));
}

String getAllEmployeesModelToJson(GetAllEmployeesModel data) =>
    json.encode(data.toJson());

class GetAllEmployeesModel {
  final int status;
  final String message;
  final List<EmployeeListData> data;

  GetAllEmployeesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllEmployeesModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException("Invalid JSON format. Data is null.");
    }
    return GetAllEmployeesModel(
      status: json["status"] ?? 0, // Providing a default value for status
      message: json["message"] ?? "", // Providing a default value for message
      data: (json["data"] as List<dynamic>?)
              ?.map((e) => EmployeeListData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Providing an empty list if data is null
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EmployeeListData {
  final int employeeId;
  final String name;
  final int userContact;
  final List<String> designations;
  final String userEmail;
  final dynamic currentAddress;

  EmployeeListData({
    required this.employeeId,
    required this.name,
    required this.userContact,
    required this.designations,
    required this.userEmail,
    required this.currentAddress,
  });

  factory EmployeeListData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException("Invalid JSON format. Data is null.");
    }
    return EmployeeListData(
      employeeId:
          json["employee_id"] ?? 0, // Providing a default value for employeeId
      name: json["name"] ?? "", // Providing a default value for name
      userContact: json["user_contact"] ??
          0, // Providing a default value for userContact
      designations: (json["designations"] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [], // Providing an empty list if designations is null
      userEmail:
          json["user_email"] ?? "", // Providing a default value for userEmail
      currentAddress: json[
          "current_address"], // No default value for currentAddress as it's dynamic
    );
  }

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "name": name,
        "user_contact": userContact,
        "designations": List<dynamic>.from(designations.map((x) => x)),
        "user_email": userEmail,
        "current_address": currentAddress,
      };
}
