import 'dart:convert';

DeleteBranchesModel deleteBranchesModelFromJson(String str) =>
    DeleteBranchesModel.fromJson(json.decode(str));

String deleteBranchesModelToJson(DeleteBranchesModel data) =>
    json.encode(data.toJson());

class DeleteBranchesModel {
  final int status;
  final DeleteBranchData data;
  final String message;

  DeleteBranchesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeleteBranchesModel.fromJson(Map<String, dynamic> json) =>
      DeleteBranchesModel(
        status: json["status"],
        data: DeleteBranchData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class DeleteBranchData {
  DeleteBranchData();

  factory DeleteBranchData.fromJson(Map<String, dynamic> json) =>
      DeleteBranchData();

  Map<String, dynamic> toJson() => {};
}
