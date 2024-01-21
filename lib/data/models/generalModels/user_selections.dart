class UserSelections {
  final int selectedCompanyId;
  final int selectedBranchId;
  final String selectedCompanyName;
  final String selectedBranchName;

  UserSelections(
      {required this.selectedBranchId,
      required this.selectedBranchName,
      required this.selectedCompanyId,
      required this.selectedCompanyName});

  factory UserSelections.fromJson(Map<String, dynamic> json) => UserSelections(
      selectedCompanyId: json["selectedCompanyId"],
      selectedBranchId: json["selectedBranchId"],
      selectedCompanyName: json["selectedCompanyName"],
      selectedBranchName: json["selectedBranchName"]);

  Map<String, dynamic> toJson() => {
        "selectedCompanyId": selectedCompanyId,
        "selectedBranchId": selectedBranchId,
        "selectedCompanyName": selectedCompanyName,
        "selectedBranchName": selectedBranchName,
      };
}
