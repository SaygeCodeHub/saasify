import 'dart:convert';

AuthenticateUserModel authenticateUserModelFromJson(String str) =>
    AuthenticateUserModel.fromJson(json.decode(str));

String authenticateUserModelToJson(AuthenticateUserModel data) =>
    json.encode(data.toJson());

class AuthenticateUserModel {
  String status;
  String message;
  AuthenticateUserData data;

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
  int userId;
  List<Company> company;

  AuthenticateUserData({
    required this.userId,
    required this.company,
  });

  factory AuthenticateUserData.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserData(
        userId: json["user_id"],
        company:
            List<Company>.from(json["company"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "company": List<dynamic>.from(company.map((x) => x.toJson())),
      };
}

class Company {
  int companyId;
  String companyName;
  List<Branch> branches;

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
  int branchId;
  String branchName;
  List<int> role;

  Branch({
    required this.branchId,
    required this.branchName,
    required this.role,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        role: List<int>.from(json["role"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch_name": branchName,
        "role": List<dynamic>.from(role.map((x) => x)),
      };
}
