import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';

class SplashContent extends StatelessWidget {
  final String text, image;

  // double height,width;

  SplashContent({
    required this.text,
    required this.image,
  });

  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: 0.1 * width,
            //getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: 0.3 * height,
          //getProportionateScreenHeight(265),
          width: 0.6 * width,
          //getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
