class AssignTaskModel {
  final String message;
  final int status;
  final Map data;

  AssignTaskModel(
      {required this.message, required this.status, required this.data});

  factory AssignTaskModel.fromJson(Map<String, dynamic> json) {
    return AssignTaskModel(
        message: json['message'], status: json['status'], data: json['data']);
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "status": status, "data": data};
  }
}
