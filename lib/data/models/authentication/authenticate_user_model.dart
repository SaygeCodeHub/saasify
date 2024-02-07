import 'dart:convert';

AuthenticateUserModel authenticateUserModelFromJson(String str) =>
    AuthenticateUserModel.fromJson(json.decode(str));

String authenticateUserModelToJson(AuthenticateUserModel data) =>
    json.encode(data.toJson());

class AuthenticateUserModel {
  final int status;
  final String message;
  final AuthenticateUserData data;

  AuthenticateUserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticateUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserModel(
        status: json["status"],
        message: json["message"],
        data: AuthenticateUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class AuthenticateUserData {
  final int userId;
  final String name;
  final List<Company> company;

  AuthenticateUserData({
    required this.userId,
    required this.name,
    required this.company,
  });

  factory AuthenticateUserData.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserData(
        userId: json["user_id"],
        name: json["name"],
        company:
            List<Company>.from(json["company"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "company": List<dynamic>.from(company.map((x) => x.toJson())),
      };
}

class Company {
  final int companyId;
  final String companyName;
  final List<Branch> branches;

  Company({
    required this.companyId,
    required this.companyName,
    required this.branches,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyId: json["company_id"],
        companyName: json["company_name"],
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_name": companyName,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}

class Branch {
  final int branchId;
  final String branchName;
  final List<int> designations;
  final List<int> accessibleModules;
  final List<double> accessibleFeatures;

  Branch({
    required this.branchId,
    required this.branchName,
    required this.designations,
    required this.accessibleModules,
    required this.accessibleFeatures,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        designations: List<int>.from(json["designations"].map((x) => x)),
        accessibleModules:
            List<int>.from(json["accessible_modules"].map((x) => x)),
        accessibleFeatures: List<double>.from(
            json["accessible_features"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch_name": branchName,
        "designations": List<dynamic>.from(designations.map((x) => x)),
        "accessible_modules":
            List<dynamic>.from(accessibleModules.map((x) => x)),
        "accessible_features":
            List<dynamic>.from(accessibleFeatures.map((x) => x)),
      };
}
