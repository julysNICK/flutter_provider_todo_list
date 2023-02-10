import 'package:flutter_provider_todo_list/redux/actions_redux.dart';
import 'package:flutter_provider_todo_list/redux/state_redux.dart';

AppStateTodo todoReducer(AppStateTodo state, action) {
  if (action == ActionsTodo.add) {
    return AppStateTodo(tasks: [...state.tasks, action.task]);
  } else if (action == ActionsTodo.remove) {
    return AppStateTodo(tasks: [...state.tasks]..removeAt(action.index));
  }
  return state;
}
