// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store_redux.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStoreMobx on _TaskStoreMobx, Store {
  Computed<int>? _$totalTasksComputed;

  @override
  int get totalTasks =>
      (_$totalTasksComputed ??= Computed<int>(() => super.totalTasks,
              name: '_TaskStoreMobx.totalTasks'))
          .value;

  late final _$tasksAtom = Atom(name: '_TaskStoreMobx.tasks', context: context);

  @override
  List<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$_TaskStoreMobxActionController =
      ActionController(name: '_TaskStoreMobx', context: context);

  @override
  void addTask(TaskModel task) {
    final _$actionInfo = _$_TaskStoreMobxActionController.startAction(
        name: '_TaskStoreMobx.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(TaskModel task) {
    final _$actionInfo = _$_TaskStoreMobxActionController.startAction(
        name: '_TaskStoreMobx.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_TaskStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
totalTasks: ${totalTasks}
    ''';
  }
}
