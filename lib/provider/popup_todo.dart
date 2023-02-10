import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_list/mobx/task_store_redux.dart';
import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:flutter_provider_todo_list/redux/actions_redux.dart';
import 'package:flutter_provider_todo_list/scopedModel/scopedModel.dart';
import 'package:flutter_provider_todo_list/scopedModel/todo_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class MyPopup extends StatelessWidget {
  const MyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    addTask(contextHere) {
      TaskModel task = TaskModel(
        title: titleController.text,
        detail: detailController.text,
      );
      // BlocProvider.of<TaskBloc>(contextHere).add(AddTodoEvent(task));
    }

    addTaskMobx(contextHere) {
      TaskModel task = TaskModel(
        title: titleController.text,
        detail: detailController.text,
      );
      // BlocProvider.of<TaskBloc>(contextHere).add(AddTodoEvent(task));
      Provider.of<TaskStoreMobx>(context, listen: false).addTask(task);
    }

    addTaskScoped(contextHere) {
      TodoModel task = TodoModel(
        title: titleController.text,
        detail: detailController.text,
      );
      // BlocProvider.of<TaskBloc>(contextHere).add(AddTodoEvent(task));
      ScopedModel.of<TodoScoped>(contextHere).add(task);
    }

    addTaskRedux(contextHere) {
      TaskModel task = TaskModel(
        title: titleController.text,
        detail: detailController.text,
      );
      // BlocProvider.of<TaskBloc>(contextHere).add(AddTodoEvent(task));
      StoreProvider.of<List<TaskModel>>(contextHere)
          .dispatch(AddTodoActions(task));
    }

    return AlertDialog(
      title: const Text('Add Task'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                hintText: 'Detail',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            addTaskMobx(context);
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
