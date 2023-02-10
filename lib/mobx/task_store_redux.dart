import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:mobx/mobx.dart';

part 'task_store_redux.g.dart';

class TaskStoreMobx = _TaskStoreMobx with _$TaskStoreMobx;

abstract class _TaskStoreMobx with Store {
  @observable
  List<TaskModel> tasks = [];

  @action
  void addTask(TaskModel task) => tasks.add(task);

  @action
  void removeTask(TaskModel task) => tasks.remove(task);

  @computed
  int get totalTasks => tasks.length;
}
