import 'package:flutter/material.dart';
import 'package:ain_todo_app/screens/todo_home.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _MyAppState();
}

class _MyAppState extends State<TodoApp> {
  // This widget is the root of your application.
  // final List<TabItem> _tabItems = [
  //   TabItem("Main", Icons.home),
  //   TabItem("Today", Icons.check_circle_outline)
  // ];

  // int _currentTab = 0;

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

  // Widget _createBottomNav() {
  //   void _onTabClick(int index) {
  //     setState(() {
  //       _currentTab = index;
  //     });
  //   }

  //   return BottomNavigationBar(
  //     items: _tabItems
  //         .map(
  //           (tabItem) => BottomNavigationBarItem(
  //               icon: Icon(tabItem.getIcon()), label: tabItem.getTitle()),
  //         )
  //         .toList(),
  //     currentIndex: _currentTab,
  //     onTap: (int index) => {
  //       _onTabClick(index),
  //     },
  //   );
  // }
}
