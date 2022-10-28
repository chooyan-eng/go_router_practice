import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostConfirmPage extends StatelessWidget {
  const PostConfirmPage(
    this.body, {
    Key? key,
  }) : super(key: key);

  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('投稿確認画面')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(body, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final router = GoRouter.of(context);
                context.go('/top/2');
              },
              child: const Text('投稿する'),
            ),
          ],
        ),
      ),
    );
  }
}
