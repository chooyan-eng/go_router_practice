import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/pages/list_page.dart';
import 'package:go_router_practice/pages/post_page.dart';
import 'package:go_router_practice/pages/settings_page.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    super.key,
    required this.selectedPage,
  });

  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: const [
            ListPage(),
            PostPage(),
            SettingsPage(),
          ][selectedPage],
        ),
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'LIST',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: 'POST',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'SETTINGS',
            ),
          ],
          currentIndex: selectedPage,
          onTap: (index) {
            context.go('/top/$index');
          },
        ),
      ],
    );
  }
}
