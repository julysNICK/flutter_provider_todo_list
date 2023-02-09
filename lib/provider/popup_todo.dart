import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:flutter_provider_todo_list/scopedModel/scopedModel.dart';
import 'package:flutter_provider_todo_list/scopedModel/todo_model.dart';
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

    addTaskScoped(contextHere) {
      TodoModel task = TodoModel(
        title: titleController.text,
        detail: detailController.text,
      );
      // BlocProvider.of<TaskBloc>(contextHere).add(AddTodoEvent(task));
      ScopedModel.of<TodoScoped>(contextHere).add(task);
    }

    return AlertDialog(
      title: const Text("Add Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Title",
            ),
            controller: titleController,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Detail",
            ),
            controller: detailController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            addTaskScoped(context);
            // Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
