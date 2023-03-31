import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoCard extends StatefulWidget {
  final String title, state;
  final DateTime createTime;

  const TodoCard({
    super.key,
    required this.title,
    required this.state,
    required this.createTime,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  static const String TODO_DATE_FORMAT = 'MM/dd';

  @override
  void initState() {
    // TODO: implement initState
    print(widget.createTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 370,
        decoration: BoxDecoration(
          // color: Colors.white,
          // color: Theme.of(context).primaryColorDark,
          gradient: LinearGradient(
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark
            ],
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(3, 3),
                color: Colors.black.withOpacity(0.3))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                DateFormat(TODO_DATE_FORMAT).format(widget.createTime),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
