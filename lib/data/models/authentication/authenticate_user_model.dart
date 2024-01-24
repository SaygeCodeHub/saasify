import 'dart:convert';

AuthenticateUserModel authenticateUserModelFromJson(String str) =>
    AuthenticateUserModel.fromJson(json.decode(str));

String authenticateUserModelToJson(AuthenticateUserModel data) =>
    json.encode(data.toJson());

class AuthenticateUserModel {
  int status;
  String message;
  AuthenticateUserData data;

  AuthenticateUserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticateUserModel.fromJson(Map<String, dynamic> json) {
    return AuthenticateUserModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      data: json["data"] != null
          ? AuthenticateUserData.fromJson(json["data"])
          : AuthenticateUserData.empty(),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class AuthenticateUserData {
  int userId;
  String name;
  List<Company> company;

  AuthenticateUserData({
    required this.userId,
    required this.name,
    required this.company,
  });

  factory AuthenticateUserData.fromJson(Map<String, dynamic> json) {
    return AuthenticateUserData(
        userId: json["user_id"] ?? 0,
        name: json["name"] ?? "",
        company: (json["company"] as List<dynamic>? ?? []).isNotEmpty
            ? List<Company>.from(
                json["company"].map((x) => Company.fromJson(x)))
            : []);
  }

  static AuthenticateUserData empty() {
    return AuthenticateUserData(userId: 0, name: "", company: []);
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "company": List<dynamic>.from(company.map((x) => x.toJson())),
      };
}

class Company {
  int? companyId;
  String companyName;
  List<Branch> branches;

  Company({
    this.companyId,
    required this.companyName,
    required this.branches,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyId: json["company_id"] ?? '',
      companyName: json["company_name"] ?? "",
      branches: (json["branches"] as List<dynamic>? ?? []).isNotEmpty
          ? List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_name": companyName,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}

class Branch {
  int branchId;
  String branchName;
  List<int> roles;

  Branch({
    required this.branchId,
    required this.branchName,
    required this.roles,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
        branchId: json["branch_id"] ?? '',
        branchName: json["branch_name"] ?? "",
        roles: (json["roles"] as List<dynamic>? ?? []).isNotEmpty
            ? List<int>.from(json["roles"].map((x) => x))
            : []);
  }

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch_name": branchName,
        "roles": List<dynamic>.from(roles.map((x) => x)),
      };
}
