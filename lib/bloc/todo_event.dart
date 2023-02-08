import 'package:flutter_provider_todo_list/provider/task_model.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  TaskModel task;
  AddTodoEvent(
    this.task,
  );
}

class DeleteTodoEvent extends TodoEvent {
  final int index;
  DeleteTodoEvent(this.index);
}
