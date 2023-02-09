import 'package:flutter_provider_todo_list/scopedModel/todo_model.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoScoped extends Model {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  int get length => _todos.length;

  void add(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
