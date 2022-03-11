import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/board/splash.dart';
import 'package:flutter_application/pages/login_page.dart';

class SpalshScreen extends StatefulWidget {
  SpalshScreen({Key key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  _SpalshScreenState() {
    new Timer(const Duration(milliseconds: 6500), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Splash(),
            ),
            (route) => false);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
