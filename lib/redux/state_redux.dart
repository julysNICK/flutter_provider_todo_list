import 'package:flutter_provider_todo_list/provider/task_model.dart';

class AppStateTodo {
  List<TaskModel> tasks = [];

  AppStateTodo({this.tasks = const []});
}
