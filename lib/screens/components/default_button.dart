import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  DefaultButton({
    required this.text,
    required this.press,
  });

  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: 0.07 * height,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 0.05 * width,
            //getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
