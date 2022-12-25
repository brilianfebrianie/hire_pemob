class Task {
  String taskOwnerID;
  String taskName;
  String taskDescription;
  String taskLocation;
  String taskCategory;
  int taskReward;

  Task(
      {required this.taskOwnerID,
      required this.taskName,
      required this.taskDescription,
      required this.taskLocation,
      required this.taskCategory,
      required this.taskReward});

  Map<String, dynamic> toJson() {
    return {
      'ownerUID': taskOwnerID,
      'taskName': taskName,
      'taskDesc': taskDescription,
      'taskLocation': taskLocation,
      'taskCategory': taskCategory,
      'taskReward': taskReward
    };
  }
}
