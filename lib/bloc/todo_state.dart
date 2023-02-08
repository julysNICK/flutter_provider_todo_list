import 'package:flutter_provider_todo_list/provider/task_model.dart';

class TodoState {
  final List<TaskModel> tasks;

  const TodoState({this.tasks = const []});
}
