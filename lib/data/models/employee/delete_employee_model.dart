class DeleteEmployeeModel {
  final String message;
  final int status;

  DeleteEmployeeModel({required this.message, required this.status});

  factory DeleteEmployeeModel.fromJson(Map<String, dynamic> json) {
    return DeleteEmployeeModel(
      message: json['message'],
      status: json['status'],
    );
  }
}
