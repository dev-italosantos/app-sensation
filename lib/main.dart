import 'package:app_quiz/core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MaterialApp(
      title: "App Quiz",
      debugShowCheckedModeBanner: false,
      home: AppWidget(),
    ),
  );
}
