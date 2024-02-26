import 'dart:convert';

GetAllTasksModel getAllTasksModelFromJson(String str) =>
    GetAllTasksModel.fromJson(json.decode(str));

String getAllTasksModelToJson(GetAllTasksModel data) =>
    json.encode(data.toJson());

class GetAllTasksModel {
  final int status;
  final String message;
  final TaskData data;

  GetAllTasksModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllTasksModel.fromJson(Map<String, dynamic> json) =>
      GetAllTasksModel(
        status: json["status"],
        message: json["message"],
        data: TaskData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class TaskData {
  final List<TasksAssignedMe> tasksAssignedToMe;
  final List<TasksAssignedMe> tasksAssignedByMe;

  TaskData({
    required this.tasksAssignedToMe,
    required this.tasksAssignedByMe,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        tasksAssignedToMe: List<TasksAssignedMe>.from(
            json["tasks_assigned_to_me"]
                .map((x) => TasksAssignedMe.fromJson(x))),
        tasksAssignedByMe: List<TasksAssignedMe>.from(
            json["tasks_assigned_by_me"]
                .map((x) => TasksAssignedMe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tasks_assigned_to_me":
            List<dynamic>.from(tasksAssignedToMe.map((x) => x.toJson())),
        "tasks_assigned_by_me":
            List<dynamic>.from(tasksAssignedByMe.map((x) => x.toJson())),
      };
}

class TasksAssignedMe {
  final String title;
  final String taskDescription;
  final DateTime dueDate;
  final int priority;
  final Assigned? assignedTo;
  final String taskStatus;
  final int taskId;
  final String? comment;
  final Assigned? assignedBy;

  TasksAssignedMe({
    required this.title,
    required this.taskDescription,
    required this.dueDate,
    required this.priority,
    required this.assignedTo,
    required this.taskStatus,
    required this.taskId,
    required this.comment,
    required this.assignedBy,
  });

  factory TasksAssignedMe.fromJson(Map<String, dynamic> json) =>
      TasksAssignedMe(
        title: json["title"],
        taskDescription: json["task_description"],
        dueDate: DateTime.parse(json["due_date"]),
        priority: json["priority"],
        assignedTo: json["assigned_to"] == null
            ? null
            : Assigned.fromJson(json["assigned_to"]),
        taskStatus: json["task_status"],
        taskId: json["task_id"],
        comment: json["comment"],
        assignedBy: json["assigned_by"] == null
            ? null
            : Assigned.fromJson(json["assigned_by"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "task_description": taskDescription,
        "due_date":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "priority": priority,
        "assigned_to": assignedTo?.toJson(),
        "task_status": taskStatus,
        "task_id": taskId,
        "comment": comment,
        "assigned_by": assignedBy?.toJson(),
      };
}

class Assigned {
  final int id;
  final String name;

  Assigned({
    required this.id,
    required this.name,
  });

  factory Assigned.fromJson(Map<String, dynamic> json) => Assigned(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
