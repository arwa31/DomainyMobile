import 'package:flutter/material.dart';
import 'package:flutter_application/pages/board/body.dart';

import '../../utils/size_config.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff008c83), Color(0xffB8B8B8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Body(),
      ),
    );
  }
}
