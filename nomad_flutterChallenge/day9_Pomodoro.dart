// import 'package:flutter/material.dart';
// import 'dart:async';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             color: Color(0xFF232B55),
//           ),
//         ),
//         cardColor: const Color(0xFFF4EDDB),
//         colorScheme: ColorScheme.fromSwatch(
//           backgroundColor: const Color(0xFFE64D3D),
//         ),
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // static var selectMinutes = 2;
//   static var selectMinutes = 1500;
//   int totalSeconds = selectMinutes;
//   bool isRunning = false;
//   late Timer timer;
//   List<String> selectMinute = ['15', '20', '25', '30', '35'];

//   int currentRound = 0;
//   int currentGoal = 0;

//   bool isRest = false;

//   void onTick(Timer timer) {
//     if (totalSeconds == 0) {
//       setState(() {
//         if (currentRound == 4) {
//           currentRound = 0;
//           currentGoal = currentGoal + 1;
//         } else {
//           currentRound = currentRound + 1;
//         }
//         isRunning = false;
//         totalSeconds = selectMinutes;
//       });
//       timer.cancel();
//       onRest();
//     } else {
//       setState(() {
//         totalSeconds = totalSeconds - 1;
//       });
//     }
//   }

//   void onRest() {
//     // var restTime = 5 * 60;
//     var restTime = 2;
//     totalSeconds = restTime;
//     timer = Timer.periodic(const Duration(seconds: 1), onRestTimer);
//     isRest = true;
//     setState(() {
//       isRunning = true;
//     });
//   }

//   void onRestTimer(Timer timer) {
//     if (totalSeconds == 0) {
//       setState(() {
//         isRunning = false;
//         isRest = false;
//         totalSeconds = selectMinutes;
//       });
//       timer.cancel();
//     } else {
//       setState(() {
//         totalSeconds = totalSeconds - 1;
//       });
//     }
//   }

//   void onStartPressed() {
//     timer = Timer.periodic(const Duration(seconds: 1), onTick);
//     setState(() {
//       isRunning = true;
//     });
//   }

//   void onPausePressed() {
//     timer.cancel();
//     setState(() {
//       isRunning = false;
//     });
//   }

//   void selectTime(int time) {
//     selectMinutes = (time * 60);
//     setState(() {
//       totalSeconds = selectMinutes;
//     });
//   }

//   void reset() {
//     setState(() {
//       selectMinutes = 1500;
//       totalSeconds = selectMinutes;
//       isRunning = false;
//       currentRound = 0;
//       currentGoal = 0;
//     });
//     timer.cancel();
//   }

//   String formatHour(int seconds) {
//     var duration = Duration(seconds: seconds);
//     return duration.toString().split(".").first.substring(2, 4);
//   }

//   String formatMinute(int seconds) {
//     var duration = Duration(seconds: seconds);
//     return duration.toString().split(".").first.substring(5, 7);
//   }

//   final ScrollController _controller = ScrollController();

//   void _onItemSelected(int index) {
//     const double itemWidth = 75; // 각 아이템의 너비
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double center = (screenWidth - itemWidth) / 2; // 화면 중앙 좌표
//     final double offset = index * (itemWidth + 20); // 선택한 아이템의 오프셋

//     _controller.jumpTo(0); // 스크롤 시작 위치를 0으로 이동

//     _controller.animateTo(
//       offset - center,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         children: [
//           Flexible(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(top: 8),
//                     alignment: Alignment.topLeft,
//                     child: const Text(
//                       'POMOTIMER',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                         onPressed: reset,
//                         color: Colors.white,
//                         iconSize: 30,
//                         padding: EdgeInsets.zero,
//                         icon: const Icon(Icons.replay_outlined)),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       width: 150,
//                       height: 180,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Text(
//                         formatHour(totalSeconds),
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.background,
//                           fontSize: 80,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       width: 40,
//                       child: Text(
//                         ':',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.4),
//                           fontSize: 80,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       width: 150,
//                       height: 180,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Text(
//                         formatMinute(totalSeconds),
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.background,
//                           fontSize: 80,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 80,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   height: 55,
//                   child: ShaderMask(
//                       shaderCallback: (Rect bounds) {
//                         return RadialGradient(
//                           radius: 4,
//                           // tileMode: TileMode.clamp,
//                           tileMode: TileMode.decal,
//                           colors: [Colors.white, Colors.white.withOpacity(0.1)],
//                         ).createShader(bounds);
//                       },
//                       child: ListView.separated(
//                         shrinkWrap: true,
//                         controller: _controller,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: selectMinute.length,
//                         // padding: EdgeInsets.symmetric(
//                         //   horizontal:
//                         //       (MediaQuery.of(context).size.width - 75) / 2,
//                         // ),
//                         itemBuilder: (context, index) {
//                           return Container(
//                             decoration: BoxDecoration(
//                               color: selectMinutes ==
//                                       (int.parse(selectMinute[index]) * 60)
//                                   ? Colors.white
//                                   : const Color(0xFFE64D3D),
//                               borderRadius: BorderRadius.circular(7),
//                               border: Border.all(
//                                 color: Colors.white,
//                                 style: BorderStyle.solid,
//                                 width: 3,
//                               ),
//                             ),
//                             alignment: Alignment.center,
//                             height: 35,
//                             width: 70,
//                             child: TextButton(
//                               onPressed: () {
//                                 selectTime(int.parse(selectMinute[index]));
//                                 // _onItemSelected(index);
//                               },
//                               child: Text(
//                                 selectMinute[index],
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.w800,
//                                   color: selectMinutes ==
//                                           (int.parse(selectMinute[index]) * 60)
//                                       ? const Color(0xFFE64D3D)
//                                       : Colors.white,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) => const SizedBox(
//                           width: 20,
//                           height: 10,
//                         ),
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 Center(
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundColor: Colors.black.withOpacity(0.2),
//                     child: isRest
//                         ? const Text('휴식시간')
//                         : IconButton(
//                             iconSize: 80,
//                             color: Colors.white,
//                             onPressed:
//                                 isRunning ? onPausePressed : onStartPressed,
//                             icon: Icon(
//                                 isRunning ? Icons.pause : Icons.play_arrow),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 200,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '$currentRound/4',
//                                 style: TextStyle(
//                                   color: Colors.white.withOpacity(0.4),
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               const Text(
//                                 'ROUND',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 '$currentGoal/12',
//                                 style: TextStyle(
//                                   color: Colors.white.withOpacity(0.4),
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               const Text(
//                                 'GOAL',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ]),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
