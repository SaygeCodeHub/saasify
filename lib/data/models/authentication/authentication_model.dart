import 'dart:convert';

AuthenticationModel authenticationModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str));

String authenticationModelToJson(AuthenticationModel data) =>
    json.encode(data.toJson());

class AuthenticationModel {
  final int status;
  final String message;
  final UserData data;

  AuthenticationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        status: json["status"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class UserData {
  final User user;
  final List<Company> companies;

  UserData({
    required this.user,
    required this.companies,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: User.fromJson(json["user"]),
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class Company {
  final String companyId;
  final String companyDomain;
  final String companyEmail;
  final String companyName;
  final String services;
  final String companyLogo;
  final DateTime onboardingDate;
  final bool isOwner;
  final List<Branch> branches;

  Company({
    required this.companyId,
    required this.companyDomain,
    required this.companyEmail,
    required this.companyName,
    required this.services,
    required this.companyLogo,
    required this.onboardingDate,
    required this.isOwner,
    required this.branches,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyId: json["company_id"],
        companyDomain: json["company_domain"],
        companyEmail: json["company_email"],
        companyName: json["company_name"],
        services: json["services"],
        companyLogo: json["company_logo"],
        onboardingDate: DateTime.parse(json["onboarding_date"]),
        isOwner: json["is_owner"],
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_domain": companyDomain,
        "company_email": companyEmail,
        "company_name": companyName,
        "services": services,
        "company_logo": companyLogo,
        "onboarding_date": onboardingDate.toIso8601String(),
        "is_owner": isOwner,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
      };
}

class Branch {
  final int branchId;
  final String branchName;
  final int branchContact;
  final String branchCurrency;
  final bool branchActive;
  final String branchAddress;

  Branch({
    required this.branchId,
    required this.branchName,
    required this.branchContact,
    required this.branchCurrency,
    required this.branchActive,
    required this.branchAddress,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        branchContact: json["branch_contact"],
        branchCurrency: json["branch_currency"],
        branchActive: json["branch_active"],
        branchAddress: json["branch_address"],
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch_name": branchName,
        "branch_contact": branchContact,
        "branch_currency": branchCurrency,
        "branch_active": branchActive,
        "branch_address": branchAddress,
      };
}

class User {
  final String userName;
  final String userId;
  final int userContact;

  User({
    required this.userName,
    required this.userId,
    required this.userContact,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["user_name"] ?? '',
        userId: json["user_id"] ?? '',
        userContact: json["user_contact"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "user_id": userId,
        "user_contact": userContact,
      };
}
