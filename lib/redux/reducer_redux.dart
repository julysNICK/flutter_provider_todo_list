import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:flutter_provider_todo_list/redux/actions_redux.dart';

List<TaskModel> todoReducer(List<TaskModel> state, action) {
  if (action == ActionsTodo.add) {
    return List.from(state)..add(action.task);
  } else if (action == ActionsTodo.remove) {
    return List.from(state)..remove(action.task);
  }
  return state;
}
