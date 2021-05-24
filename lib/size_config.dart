import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData mediaQueryData;
  //SizeConfig({required this.mediaQueryData, required this.defaultSize,required this.orientation,required this.screenHeight,required this.screenWidth});
  late double screenWidth;
  late double screenHeight;
  late double defaultSize;
  late Orientation orientation;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig().screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig().screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
