import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: Scaffold(
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
        body: const MyHomePage(),
      ),
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

    String selectedTime =
        "$selectedHour:${selectedMinute >= 10 ? selectedMinute : "0$selectedMinute"} ${selectedHour >= 12 ? "PM" : "AM"} ";

    return Column(
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
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: const Text(
                      'Make video',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'This is item $index',
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    leading:
                        const Icon(Icons.check_circle, color: Colors.green),
                  ),
                );
              }),
        ))
      ],
    );
  }
}
