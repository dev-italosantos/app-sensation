import 'package:app_quiz/helper/functions.dart';
import 'package:app_quiz/screens/home/home_screen.dart';
import 'package:app_quiz/splash/splash.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App Quiz",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
