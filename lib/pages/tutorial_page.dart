import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チュートリアル')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.settings_system_daydream_outlined),
            const SizedBox(height: 32),
            const Text('これはチュートリアルです。'),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {},
              child: const Text('利用を開始する'),
            ),
          ],
        ),
      ),
    );
  }
}
