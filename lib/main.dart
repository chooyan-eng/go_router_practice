import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/pages/bottom_navigator.dart';
import 'package:go_router_practice/pages/login_page.dart';
import 'package:go_router_practice/pages/splash_page.dart';
import 'package:go_router_practice/pages/tutorial_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

enum TopPageType { none, top, tutorial, login }

class TopPageState extends ValueNotifier<TopPageType> {
  TopPageState(TopPageType initialPage) : super(initialPage);

  Future<void> init() async {
    final pref = await SharedPreferences.getInstance();
    // チュートリアルが完了しているかどうか
    final doneTutorial = pref.getBool(TopPageType.tutorial.name) ?? false;

    // ログイン済みで UID が保存されているかどうか。
    final uid = pref.getString(TopPageType.login.name);

    if (doneTutorial) {
      if (uid != null) {
        // チュートリアルもログインも済んでいる場合はトップページ
        value = TopPageType.top;
      } else {
        // チュートリアルは見たがログインしていない場合はトップページ
        value = TopPageType.login;
      }
    } else {
      // チュートリアルもまだな場合はチュートリアル画面から
      value = TopPageType.tutorial;
    }
    notifyListeners();
  }
}

final pageStateProvider = Provider<TopPageState>((ref) {
  // ここで初回表示すべきページを制御する
  return TopPageState(TopPageType.none)..init();
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
        // ここに登録したオブジェクトが notifyListeners() するたびに redirect が評価される
        refreshListenable: ref.read(pageStateProvider),
        redirect: (context, state) {
          // ここで null を返却した場合は routes に指定の通りの遷移になる
          // path 文字列を返却した場合は該当する route に遷移する（戻れない）

          switch (ref.read(pageStateProvider).value) {
            case TopPageType.none:
              return null;
            case TopPageType.tutorial:
              // 遷移先がチュートリアルの場合はそのまま、それ以外は強制でチュートリアル
              return state.location == '/tutorial' ? null : '/tutorial';
            case TopPageType.login:
              // 遷移先がログインの場合はそのまま、それ以外は強制でログイン画面
              return state.location == '/login' ? null : '/login';
            case TopPageType.top:
              // 指定通りの画面へ
              if (!state.location.startsWith('/top')) {
                return '/top/0';
              }
              return null;
          }
        },
        initialLocation: '/',
        errorBuilder: (context, state) {
          return Container();
        },
        routes: <GoRoute>[
          GoRoute(
            path: '/',
            builder: (context, state) => const SplashPage(),
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
