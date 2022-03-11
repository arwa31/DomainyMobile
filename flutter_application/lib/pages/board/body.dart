import 'package:flutter/material.dart';
import 'package:flutter_application/pages/board/splashContent.dart';
import 'package:flutter_application/pages/login_page.dart';

import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Quisque mollis orci ",
      "desc":
          "Aliquam vehicula magna sit amet dui semper,\n et sollicitudin augue lacinia.",
      "image": "assets/images/jaune.png",
    },
    {
      "title": "Suspendisse sollicitudin ",
      "desc":
          "Proin ac est vehicula, porttitor odio . \nDuis laoreet tincidunt aliquet. \nDuis condimentum nisi egestas ",
      "image": "assets/images/Violet.png",
    },
    {
      "title": "SAliquam condimentum ",
      "desc":
          "Etiam lorem eros, \nplacerat sed pretium eget fringilla ultricies sapien.\n Phasellus laoreet tempus magna",
      "image": "assets/images/orange1.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: splashData.length,
              onPageChanged: (value) {
                setState(
                  () {
                    currentPage = value;
                  },
                );
              },
              itemBuilder: (context, index) => SplashContent(
                title: splashData[index]["title"],
                desc: splashData[index]["desc"],
                image: splashData[index]["image"],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDotsContainer(index),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                FlatButton(
                  height: getProportionalScreenHeight(60),
                  minWidth: getProportionalScreenwidth(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          getProportionalScreenHeight(60))),
                  color: fPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionalScreenHeight(18),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

// aka 3 points eli yaadyw tsawer
  Column buildDotsContainer(int index) {
    return Column(
      children: [
        Container(
          height: 6,
          margin: EdgeInsets.only(right: 5),
          width: currentPage == index ? 20 : 6,
          decoration: BoxDecoration(
              color: currentPage == index ? fPrimaryColor : fTextColor,
              borderRadius: BorderRadius.circular(6)),
        )
      ],
    );
  }
}
