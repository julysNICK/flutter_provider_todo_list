import 'package:flutter/material.dart';
import 'package:flutter_provider_todo_list/provider/popup_todo.dart';
import 'package:flutter_provider_todo_list/provider/task_model.dart';
import 'package:flutter_provider_todo_list/redux/reducer_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<List<TaskModel>> store = Store<List<TaskModel>>(
    todoReducer,
    initialState: [],
  );
  runApp(
    StoreProvider(
      store: store,
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

    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            // Icon(Icons.menu, color: Colors.white),
            // SizedBox(width: 10),
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
                child: StoreConnector<List<TaskModel>, List<TaskModel>>(
                  converter: (store) => store.state,
                  builder: (context, todo) {
                    return ListView.builder(
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(
                              todo[index].title,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              todo[index].detail,
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
      floatingActionButton: StoreConnector<List<TaskModel>, List<TaskModel>>(
        converter: (store) => store.state,
        builder: (context, todo) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const MyPopup();
                },
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              curve: Curves.easeIn,
              duration: Duration(seconds: 10),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
