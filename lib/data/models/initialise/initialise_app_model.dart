import 'dart:convert';

InitialiseAppModel initialiseAppModelFromJson(String str) =>
    InitialiseAppModel.fromJson(json.decode(str));

String initialiseAppModelToJson(InitialiseAppModel data) =>
    json.encode(data.toJson());

class InitialiseAppModel {
  final int? status;
  final String? message;
  final InitialiseAppData? data;

  InitialiseAppModel({
    this.status,
    this.message,
    this.data,
  });

  factory InitialiseAppModel.fromJson(Map<String, dynamic> json) =>
      InitialiseAppModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : InitialiseAppData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class InitialiseAppData {
  final List<ListOfBranches>? branches;
  final List<ModulesModel>? accessibleModules;
  final List<ModulesModel>? availableModules;
  List<TasksAssignedMe>? tasksAssignedToMe;
  List<TasksAssignedMe>? tasksAssignedByMe;
  List<Announcement>? announcements;
  final bool? geoFencing;
  dynamic gender;

  InitialiseAppData(
      {this.branches,
      this.accessibleModules,
      this.availableModules,
      this.geoFencing,
      this.gender,
      this.tasksAssignedToMe,
      this.tasksAssignedByMe,
      this.announcements});

  factory InitialiseAppData.fromJson(Map<String, dynamic> json) => InitialiseAppData(
      branches: json["branches"] == null
          ? []
          : List<ListOfBranches>.from(
              json["branches"]!.map((x) => ListOfBranches.fromJson(x))),
      accessibleModules: json["accessible_modules"] == null
          ? []
          : List<ModulesModel>.from(
              json["accessible_modules"]!.map((x) => ModulesModel.fromJson(x))),
      availableModules: json["available_modules"] == null
          ? []
          : List<ModulesModel>.from(
              json["available_modules"]!.map((x) => ModulesModel.fromJson(x))),
      tasksAssignedToMe: json["tasks_assigned_to_me"] == null
          ? []
          : List<TasksAssignedMe>.from(json["tasks_assigned_to_me"]!
              .map((x) => TasksAssignedMe.fromJson(x))),
      tasksAssignedByMe: json["tasks_assigned_by_me"] == null
          ? []
          : List<TasksAssignedMe>.from(json["tasks_assigned_by_me"]!
              .map((x) => TasksAssignedMe.fromJson(x))),
      announcements:
          json["announcements"] == null ? [] : List<Announcement>.from(json["announcements"]!.map((x) => Announcement.fromJson(x))),
      geoFencing: json["geo_fencing"],
      gender: json["gender"]);

  Map<String, dynamic> toJson() => {
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "accessible_modules": accessibleModules == null
            ? []
            : List<dynamic>.from(accessibleModules!.map((x) => x.toJson())),
        "available_modules": availableModules == null
            ? []
            : List<dynamic>.from(availableModules!.map((x) => x.toJson())),
        "tasks_assigned_by_me": tasksAssignedByMe == null
            ? []
            : List<dynamic>.from(tasksAssignedByMe!.map((x) => x.toJson())),
        "tasks_assigned_to_me": tasksAssignedToMe == null
            ? []
            : List<dynamic>.from(tasksAssignedToMe!.map((x) => x.toJson())),
        "announcements": announcements == null
            ? []
            : List<dynamic>.from(announcements!.map((x) => x.toJson())),
        "geo_fencing": geoFencing,
        "gender": gender
      };
}

class ModulesModel {
  final String? moduleKey;
  final int? moduleId;
  final String? title;
  final String? icon;
  final List<FeatureDetailModel>? accessibleFeatures;
  final List<FeatureDetailModel>? availableFeatures;

  ModulesModel({
    this.moduleKey,
    this.moduleId,
    this.title,
    this.icon,
    this.accessibleFeatures,
    this.availableFeatures,
  });

  factory ModulesModel.fromJson(Map<String, dynamic> json) => ModulesModel(
        moduleKey: json["module_key"],
        moduleId: json["module_id"],
        title: json["title"],
        icon: json["icon"],
        accessibleFeatures: json["accessible_features"] == null
            ? []
            : List<FeatureDetailModel>.from(json["accessible_features"]!
                .map((x) => FeatureDetailModel.fromJson(x))),
        availableFeatures: json["available_features"] == null
            ? []
            : List<FeatureDetailModel>.from(json["available_features"]!
                .map((x) => FeatureDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "module_key": moduleKey,
        "module_id": moduleId,
        "title": title,
        "icon": icon,
        "accessible_features": accessibleFeatures == null
            ? []
            : List<dynamic>.from(accessibleFeatures!.map((x) => x.toJson())),
        "available_features": availableFeatures == null
            ? []
            : List<dynamic>.from(availableFeatures!.map((x) => x.toJson())),
      };
}

class FeatureDetailModel {
  final String? featureKey;
  final double? featureId;
  final bool? isStatistics;
  final String? title;
  final String? icon;
  final String? value;

  FeatureDetailModel({
    this.featureKey,
    this.featureId,
    this.isStatistics,
    this.title,
    this.icon,
    this.value,
  });

  factory FeatureDetailModel.fromJson(Map<String, dynamic> json) =>
      FeatureDetailModel(
        featureKey: json["feature_key"],
        featureId: json["feature_id"],
        isStatistics: json["is_statistics"],
        title: json["title"],
        icon: json["icon"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "feature_key": featureKey,
        "feature_id": featureId,
        "is_statistics": isStatistics,
        "title": title,
        "icon": icon,
        "value": value,
      };
}

class ListOfBranches {
  final String? branchName;
  final int? branchId;

  ListOfBranches({
    this.branchName,
    this.branchId,
  });

  factory ListOfBranches.fromJson(Map<String, dynamic> json) => ListOfBranches(
        branchName: json["branch_name"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "branch_id": branchId,
      };
}

class Announcement {
  int id;
  DateTime dueDate;
  String description;
  bool isActive;
  DateTime publishedTime;

  Announcement({
    required this.id,
    required this.dueDate,
    required this.description,
    required this.isActive,
    required this.publishedTime,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        dueDate: DateTime.parse(json["due_date"]),
        description: json["description"],
        isActive: json["is_active"],
        publishedTime: DateTime.parse(json["published_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "due_date":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "description": description,
        "is_active": isActive,
        "published_time": publishedTime.toIso8601String(),
      };
}

class TasksAssignedMe {
  String title;
  String taskDescription;
  DateTime dueDate;
  int priority;
  Assigned? assignedTo;
  String taskStatus;
  int taskId;
  Assigned? assignedBy;

  TasksAssignedMe({
    required this.title,
    required this.taskDescription,
    required this.dueDate,
    required this.priority,
    this.assignedTo,
    required this.taskStatus,
    required this.taskId,
    this.assignedBy,
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
        "assigned_by": assignedBy?.toJson(),
      };
}

class Assigned {
  int id;
  String name;

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
