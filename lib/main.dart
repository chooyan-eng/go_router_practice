import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/pages/bottom_navigator.dart';
import 'package:go_router_practice/pages/login_page.dart';
import 'package:go_router_practice/pages/tutorial_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

enum TopPageType { top, tutorial, login }

class TopPageState extends ValueNotifier<TopPageType> {
  TopPageState(TopPageType initialPage) : super(initialPage);
}

final pageStateProvider = Provider<TopPageState>((ref) {
  // ここで初回表示すべきページを制御する
  const initialPage = TopPageType.login;
  return TopPageState(initialPage);
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 以下のパラメータは不要になった
      // routeInformationParser: ,
      // routeInformationProvider: ,
      routerConfig: GoRouter(
        refreshListenable: ref.read(pageStateProvider),
        redirect: (context, state) {
          switch (ref.read(pageStateProvider).value) {
            case TopPageType.tutorial:
              return state.location == '/tutorial' ? null : '/tutorial';
            case TopPageType.login:
              return state.location == '/login' ? null : '/login';
            case TopPageType.top:
              return state.path;
          }
        },
        initialLocation: '/',
        errorBuilder: (context, state) {
          return Container();
        },
        routes: <GoRoute>[
          GoRoute(
            path: '/',
            builder: (context, state) => Container(),
          ),
          GoRoute(
            name: 'tutorial',
            path: '/tutorial',
            builder: (context, state) {
              return const TutorialPage();
            },
          ),
          GoRoute(
            name: 'login',
            path: '/login',
            builder: (context, state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: '/top/:pageIndex',
            builder: (context, state) {
              return BottomNavigator(
                selectedPage: int.parse(state.params['pageIndex']!),
              );
            },
          ),
        ],
      ),
    );
  }
}
