import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_list/bloc/bloc.dart';
import 'package:flutter_provider_todo_list/bloc/todo_state.dart';
import 'package:flutter_provider_todo_list/provider/popup_todo.dart';
import 'package:flutter_provider_todo_list/provider/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<TaskBloc>(
      create: (context) => TaskBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int selectedMinute = now.minute;
    int selectedHour = now.hour;
    TextEditingController titleController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    String selectedTime =
        "$selectedHour:${selectedMinute >= 10 ? selectedMinute : "0$selectedMinute"} ${selectedHour >= 12 ? "PM" : "AM"} ";
    addTask(contextHere) {
      TaskModel task = TaskModel(
        title: titleController.text,
        detail: detailController.text,
      );
      Provider.of<TodoModel>(contextHere, listen: false).addTaskInitList();
    }

    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
            Text('Todo App'),
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  selectedTime,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BlocBuilder<TaskBloc, TodoState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(
                              state.tasks[index].title,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              state.tasks[index].detail,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            leading: const Icon(Icons.check_circle,
                                color: Colors.green),
                          ),
                        );
                      },
                    );
                  },
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const MyPopup();
                });
            // Provider.of<TodoModel>(context, listen: false).addTaskInitList();
          },
          child: const Icon(Icons.add)),
    );
  }
}
