import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_study/mvvm/ui/post/post_viewmodel.dart';
import 'package:mvvm_study/mvvm/ui/post/post_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //메인페이지를 PostPage로 지정하고, 'PostViewModel'을 Provider로 등록하기
    return ChangeNotifierProvider(
      create: (context) => PostViewModel(),
      child: MaterialApp(
        title: 'Flutter MVVM 게시판',
        home: PostPage(),
      ),
    );
  }
}
