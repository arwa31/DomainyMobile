import 'package:flutter/material.dart';
import 'package:flutter_application/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domainy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 241, 241, 241),
        fontFamily: 'SFProDisplay',
      ),
      home: SpalshScreen(),
    );
  }
}
