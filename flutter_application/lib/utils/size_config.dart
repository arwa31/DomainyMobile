import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenwidth;
  static double screenHeight;
  static Orientation orientation;
  static double defualtSize;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenwidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// get the proportionate height as per as screen size
double getProportionalScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

// get the proportionate width as per as screen size
double getProportionalScreenwidth(double inputwidth) {
  double screenwidth = SizeConfig.screenwidth;
  return (inputwidth / 375.0) * screenwidth;
}
