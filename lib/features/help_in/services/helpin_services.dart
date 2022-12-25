import 'package:build_hire_app/model/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  static void addTask(Task task) async {
    await FirebaseFirestore.instance.collection('tasks').add(task.toJson());

    print("Task Added");
  }
}
