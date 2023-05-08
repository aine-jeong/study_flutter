abstract class PostEvent {}

class AddPostEvent extends PostEvent {
  final String content;
  final String author;

  AddPostEvent({required this.content, required this.author});
}

class RemovePostEvent extends PostEvent {
  final int index;

  RemovePostEvent({required this.index});
}
