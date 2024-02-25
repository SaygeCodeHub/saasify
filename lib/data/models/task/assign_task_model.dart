class TaskModel {
  final String message;
  final int status;
  final Map data;

  TaskModel({required this.message, required this.status, required this.data});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        message: json['message'], status: json['status'], data: json['data']);
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "status": status, "data": data};
  }
}
