import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_list/provider/task_model.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> tasks = [];

  addTaskInitList() {
    TaskModel task =
        TaskModel(title: "${tasks.length}", detail: "Detail ${tasks.length}");
    tasks.add(task);
    notifyListeners();
  }

  insertTask(TaskModel task) {
    tasks.add(task);
    notifyListeners();
  }
}
