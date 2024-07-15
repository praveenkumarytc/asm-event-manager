import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static late TextScaler textScaler;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    textScaler = MediaQuery.of(context).textScaler;
  }
}

// Extension to make your dimensions responsive
extension SizeDoubleExt on double {
  double h() {
    double screenHeight = SizeConfig.screenHeight;
    var res = (this / 700.0) * screenHeight; // Adjust based on your design
    return res;
  }

  double w() {
    double screenWidth = SizeConfig.screenWidth;
    var res = (this / 450.0) * screenWidth; // Adjust based on your design
    return res;
  }

  double sp() {
    return SizeConfig.textScaler.scale(this); // Scale fontSize dynamically
  }
}
