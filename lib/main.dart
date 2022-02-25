import 'package:app_quiz/core/core.dart';
import 'package:app_quiz/helper/functions.dart';
import 'package:app_quiz/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isUserLoggedIn = false;

  @override
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }

 checkUserLoggedInStatus() async {
    await HelperFunctioncs.getUserLoggedInDetails().then((value) {
      setState(() {
        _isUserLoggedIn = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWidget();
  }
}
