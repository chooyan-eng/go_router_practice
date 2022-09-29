import 'package:flutter/material.dart';
import 'package:go_router_practice/pages/list_page.dart';
import 'package:go_router_practice/pages/post_page.dart';
import 'package:go_router_practice/pages/settings_page.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: const [
            ListPage(),
            PostPage(),
            SettingsPage(),
          ][_page],
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
          currentIndex: _page,
          onTap: (index) {
            setState(() => _page = index);
          },
        ),
      ],
    );
  }
}
