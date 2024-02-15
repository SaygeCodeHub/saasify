class GetEmployeeModel {
  final int status;
  final String message;
  final Map<String, dynamic> data;

  GetEmployeeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetEmployeeModel.fromJson(Map<String, dynamic> json) =>
      GetEmployeeModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
