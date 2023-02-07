import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_list/task_model.dart';
import 'package:flutter_provider_todo_list/todo_model.dart';
import 'package:provider/provider.dart';

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
      Provider.of<TodoModel>(contextHere, listen: false).insertTask(task);
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
            addTask(context);
            // Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
