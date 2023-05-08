import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mvvm_study/bloc/models/post.dart';
import 'package:mvvm_study/bloc/events/posts_event.dart';
import 'package:mvvm_study/bloc/states/posts_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());

  final List<Post> _posts = [];

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is AddPostEvent) {
      final post = Post(
        content: event.content,
        author: event.author,
      );

      _posts.add(post);

      yield PostLoaded(posts: _posts);
    } else if (event is RemovePostEvent) {
      _posts.removeAt(event.index);

      yield PostLoaded(posts: _posts);
    }
  }
}
