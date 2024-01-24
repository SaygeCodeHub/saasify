import 'dart:convert';

AddCompanyModel addCompanyModelFromJson(String str) =>
    AddCompanyModel.fromJson(json.decode(str));

String addCompanyModelToJson(AddCompanyModel data) =>
    json.encode(data.toJson());

class AddCompanyModel {
  int status;
  String message;
  CompanyData data;

  AddCompanyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddCompanyModel.fromJson(Map<String, dynamic> json) =>
      AddCompanyModel(
        status: json["status"],
        message: json["message"],
        data: CompanyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class CompanyData {
  int companyId;
  String companyName;
  Branch branch;

  CompanyData({
    required this.companyId,
    required this.companyName,
    required this.branch,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
        companyId: json["company_id"],
        companyName: json["company_name"],
        branch: Branch.fromJson(json["branch"]),
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId,
        "company_name": companyName,
        "branch": branch.toJson(),
      };
}

class Branch {
  String branchName;
  int branchId;

  Branch({
    required this.branchName,
    required this.branchId,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchName: json["branch_name"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "branch_id": branchId,
      };
}
