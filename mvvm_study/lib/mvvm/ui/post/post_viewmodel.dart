import 'package:flutter/material.dart';
import 'package:mvvm_study/mvvm/data/models/post.dart';

class PostViewModel extends ChangeNotifier {
  final List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(String content, String author) {
    final post = Post(
      content: content,
      author: author,
    );

    _posts.add(post);

    notifyListeners();
  }

  void removePost(int index) {
    _posts.removeAt(index);

    notifyListeners();
  }
}
