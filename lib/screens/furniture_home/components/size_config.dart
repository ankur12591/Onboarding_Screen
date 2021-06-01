import 'package:flutter/material.dart';

class SizeConfig {
  late double screenWidth;
  late double screenHeight;
  late double defaultSize;
  late Orientation orientation;

  void init(BuildContext context) {
    //_mediaQueryData = MediaQuery.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
