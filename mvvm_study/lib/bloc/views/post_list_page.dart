import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_study/bloc/states/posts_state.dart';
import 'package:mvvm_study/bloc/blocs/posts_bloc.dart';
import 'package:mvvm_study/mvvm/data/models/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시판'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(hintText: '내용'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(hintText: '작성자'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final content = _contentController.text;
                final author = _authorController.text;
                final post = Post(content: content, author: author);

                BlocProvider.of<PostBloc>(context).add(AddPost(post));

                _contentController.clear();
                _authorController.clear();
              },
              child: const Text('작성'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostLoadInProgress) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PostLoadSuccess) {
                    final posts = state.posts;

                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];

                        return Card(
                          child: ListTile(
                            title: Text(post.content),
                            subtitle: Text(post.author),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                BlocProvider.of<PostBloc>(context).add(DeletePost(post));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('게시글이 삭제되었습니다.'),
                                    duration: const Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: '취소',
                                      onPressed: () {
                                        BlocProvider.of<PostBloc>(context).add(AddPost(post));
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('게시글을 불러올 수 없습니다.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
