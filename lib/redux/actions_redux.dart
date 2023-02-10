import 'package:flutter_provider_todo_list/provider/task_model.dart';

class AddTodoActions {
  TaskModel task;
  AddTodoActions(
    this.task,
  );
}

class DeleteTodoActions {
  final int index;
  DeleteTodoActions(this.index);
}
