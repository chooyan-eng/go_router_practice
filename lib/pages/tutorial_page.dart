import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_practice/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialPage extends ConsumerWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チュートリアル'),
        leading: Container(),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Icon(Icons.settings_system_daydream_outlined),
              const SizedBox(height: 32),
              const Text('これはチュートリアルです。'),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  SharedPreferences.getInstance().then((pref) {
                    pref.setBool(TopPageType.tutorial.name, true);
                    ref.read(pageStateProvider).value = TopPageType.login;
                  });
                },
                child: const Text('利用を開始する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
