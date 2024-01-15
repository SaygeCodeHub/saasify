import 'dart:convert';

FetchAllBranchesModel fetchAllBranchesModelFromJson(String str) =>
    FetchAllBranchesModel.fromJson(json.decode(str));

String fetchAllBranchesModelToJson(FetchAllBranchesModel data) =>
    json.encode(data.toJson());

class FetchAllBranchesModel {
  final int status;
  final String message;
  final List<BranchesData> data;

  FetchAllBranchesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchAllBranchesModel.fromJson(Map<String, dynamic> json) =>
      FetchAllBranchesModel(
        status: json["status"],
        message: json["message"],
        data: List<BranchesData>.from(
            json["data"].map((x) => BranchesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BranchesData {
  final int branchId;
  final String branchName;
  final int branchContact;
  final String branchCurrency;
  final bool branchActive;
  final String branchAddress;

  BranchesData({
    required this.branchId,
    required this.branchName,
    required this.branchContact,
    required this.branchCurrency,
    required this.branchActive,
    required this.branchAddress,
  });

  factory BranchesData.fromJson(Map<String, dynamic> json) => BranchesData(
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
