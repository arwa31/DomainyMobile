import 'package:flutter/material.dart';
import 'package:flutter_application/utils/constants.dart';

import '../../utils/size_config.dart';

//taswira+text
class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.image,
    this.title,
    this.desc,
  }) : super(key: key);
  final String image, title, desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: getProportionalScreenHeight(360),
          width: getProportionalScreenHeight(360),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: fTextColor,
            fontSize: getProportionalScreenHeight(28),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: getProportionalScreenHeight(10),
        ),
        Text(
          desc,
          style: TextStyle(fontSize: getProportionalScreenHeight(15)),
          textAlign: TextAlign.center,
        ),
        Spacer()
      ],
    );
  }
}
