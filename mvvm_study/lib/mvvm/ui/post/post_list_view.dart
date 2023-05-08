import 'package:flutter/material.dart';
import 'package:mvvm_study/mvvm/ui/post/post_viewmodel.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    //viewModel의 상태변화 감지
    final viewModel = Provider.of<PostViewModel>(context);

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
                viewModel.addPost(
                  _contentController.text,
                  _authorController.text,
                );

                _contentController.clear();
                _authorController.clear();
              },
              child: const Text('작성'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.posts.length,
                itemBuilder: (context, index) {
                  final post = viewModel.posts[index];

                  return Card(
                    child: ListTile(
                      title: Text(post.content),
                      subtitle: Text(post.author),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          viewModel.removePost(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
