import 'package:ain_todo_app/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

String checkTime() {
  var now = DateTime.now();
  initializeDateFormatting();
  DateFormat formatter = DateFormat('yyyy.MM.dd E', 'ko');
  String strToday = formatter.format(now);
  // String formatDate = DateFormat('yyyy.MM.dd E', 'ko').format(now);
  return strToday;
}

class _TodoHomeState extends State<TodoHome> {
  // var now = DateTime.now();
  // DateFormat formatter = DateFormat('yyyy.MM.dd EEEE');
  // String strToday = formatter.format(now);
  // String strToday = DateFormat('yyyy.MM.dd EEEE').format(now);

  String strToday = checkTime();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorDark
                  ],
                ),
              ),
              child: Padding(
                padding:
                    // const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // Dateformat(),
                      strToday,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const Text(
                      'Today',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: '할 일을 입력하세요',
                          hintStyle: const TextStyle(color: Colors.white),
                          suffixIcon: const Icon(Icons.add_circle),
                          suffixIconColor: Theme.of(context).primaryColor,
                          // suffixIconConstraints:
                          //     const BoxConstraints(minHeight: 10),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TodoCard(
                            title: '뉴스레터 읽기',
                            state: '',
                            createTime: DateTime.now(),
                          ),
                          TodoCard(
                            title: '물 1L 마시기',
                            state: '',
                            createTime: DateTime.now(),
                          ),
                          TodoCard(
                            title: '30분 걷기',
                            state: '',
                            createTime: DateTime.now(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
