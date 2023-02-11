import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:riverpod/riverpod.dart';

final todoListProviderRiverPod =
    StateNotifierProvider<TodoListProvider, List<TaskModel>>(
  (ref) => TodoListProvider(),
);

class TodoListProvider extends StateNotifier<List<TaskModel>> {
  TodoListProvider() : super([]);

  void addTodo(TaskModel todo) {
    state = [...state, todo];
  }

  void removeTodo(TaskModel todo) {
    state = state.where((element) => element != todo).toList();
  }

  void updateTodo(TaskModel todo) {
    state = state.map((element) {
      if (element == todo) {
        return todo;
      } else {
        return element;
      }
    }).toList();
  }
}
