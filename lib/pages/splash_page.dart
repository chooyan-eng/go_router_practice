import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: const Center(
          child: Icon(
            Icons.assistant_navigation,
            size: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
