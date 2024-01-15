import 'dart:convert';

SaveBranchesModel saveBranchesModelFromJson(String str) =>
    SaveBranchesModel.fromJson(json.decode(str));

String saveBranchesModelToJson(SaveBranchesModel data) =>
    json.encode(data.toJson());

class SaveBranchesModel {
  final int status;
  final BranchesData data;
  final String message;

  SaveBranchesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SaveBranchesModel.fromJson(Map<String, dynamic> json) =>
      SaveBranchesModel(
        status: json["status"],
        data: BranchesData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class BranchesData {
  BranchesData();

  factory BranchesData.fromJson(Map<String, dynamic> json) => BranchesData();

  Map<String, dynamic> toJson() => {};
}
