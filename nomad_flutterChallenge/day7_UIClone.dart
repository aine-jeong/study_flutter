// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;

//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1F1F1F),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 10,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 60,
//               ),
//               Column(
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Icon(
//                       //   Icons.account_circle_sharp,
//                       //   color: Colors.white,
//                       //   size: 50,
//                       // ),
//                       SizedBox(
//                         height: 60,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(50),
//                           child: Image.network(
//                             'https://ifh.cc/g/bqY0g4.jpg',
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.add,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   Text(
//                     'MONDAY 16',
//                     style: TextStyle(
//                         color: Colors.white.withOpacity(0.7),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'TODAY',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 45,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       const Icon(
//                         Icons.circle,
//                         color: Color(0xFFAF267F),
//                         size: 10,
//                       ),
//                       Text(
//                         '17',
//                         style: TextStyle(
//                             color: Colors.white.withOpacity(0.5),
//                             fontSize: 45,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         '18',
//                         style: TextStyle(
//                             color: Colors.white.withOpacity(0.5),
//                             fontSize: 45,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         '19',
//                         style: TextStyle(
//                             color: Colors.white.withOpacity(0.5),
//                             fontSize: 45,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         '2',
//                         style: TextStyle(
//                             color: Colors.white.withOpacity(0.5),
//                             fontSize: 45,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 670,
//                     child: ListView(
//                       padding: EdgeInsets.zero,
//                       children: const [
//                         TodoCard(
//                           startHour: '11',
//                           startMinute: '30',
//                           endHour: '12',
//                           endMinute: '20',
//                           todo: 'DESIGN MEETING',
//                           backColor: Color(0xFFFEF854),
//                           mans: ['ALEX', 'HELENA', 'NANA'],
//                         ),
//                         // Co
//                         TodoCard(
//                           startHour: '12',
//                           startMinute: '35',
//                           endHour: '14',
//                           endMinute: '10',
//                           todo: 'DAILY PROJECT',
//                           backColor: Color(0xFF9C6BCE),
//                           mans: ['ME', 'RICHARD', 'CIRY', '+4'],
//                         ),
//                         // Co
//                         TodoCard(
//                           startHour: '15',
//                           startMinute: '00',
//                           endHour: '16',
//                           endMinute: '30',
//                           todo: 'WEEKLY PLANNING',
//                           backColor: Color(0xFFBCEE4B),
//                           mans: ['DEN', 'NANA', 'MARK'],
//                         ),
//                         // Conta
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TodoCard extends StatelessWidget {
//   final String startHour, startMinute, endHour, endMinute, todo;
//   final Color backColor;
//   final List<String> mans;

//   const TodoCard({
//     super.key,
//     required this.startHour,
//     required this.startMinute,
//     required this.endHour,
//     required this.endMinute,
//     required this.todo,
//     required this.mans,
//     required this.backColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       height: 220,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(40),
//         color: backColor,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Row(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       startHour,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       startMinute,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Container(
//                       width: 1,
//                       height: 28,
//                       color: Colors.black,
//                     ),
//                     Text(
//                       endHour,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       endMinute,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 300,
//                   child: Row(
//                     children: [
//                       Flexible(
//                           child: RichText(
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                         strutStyle: const StrutStyle(
//                           fontSize: 55,
//                         ),
//                         text: TextSpan(
//                           text: todo,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 55,
//                             fontWeight: FontWeight.w500,
//                             height: 0.5,
//                             letterSpacing: -2,
//                           ),
//                         ),
//                       )),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 3,
//                   width: 30,
//                 ),
//                 for (var man in mans)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       man,
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: man == 'ME'
//                               ? Colors.black
//                               : Colors.black.withOpacity(0.3)),
//                     ),
//                   ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
