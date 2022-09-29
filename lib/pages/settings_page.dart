import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('設定画面')),
      body: ListView(
        children: const [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('アカウント'),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('お知らせ'),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('プライバシーポリシー'),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('ライセンス'),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('バージョン情報'),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('お問合せ'),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('公式サイト'),
            ),
          ),
        ],
      ),
    );
  }
}
