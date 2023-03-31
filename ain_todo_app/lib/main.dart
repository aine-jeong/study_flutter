import 'package:flutter/material.dart';
import 'package:ain_todo_app/screens/todo_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIN TODO',
      theme: ThemeData(
          canvasColor: const Color.fromARGB(255, 242, 241, 241),
          primaryColor: const Color(0xFFB062FF),
          primaryColorDark: const Color(0xFF629AEF)),
      home: const TodoHome(),
    );
  }
}
