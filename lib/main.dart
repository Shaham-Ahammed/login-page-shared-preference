import 'package:flutter/material.dart';

import 'package:task4_login_page/screens/SplashScreen.dart';


void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple[800],
      ),
      home: const SplashScreen(),
    );
  }
}
