import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('投稿画面')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: const Text('投稿する'),
            ),
          ],
        ),
      ),
    );
  }
}
