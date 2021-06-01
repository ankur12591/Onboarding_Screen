import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/components/title_text.dart';
import 'package:onboarding_screen/screens/furniture_home/constants.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Product.dart';
import 'package:onboarding_screen/screens/furniture_home/size_config.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  ProductDescription({required this.product});

  late double defaultSize;
  late Orientation orientation;
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (Orientation.landscape == true) {
      defaultSize = height * 0.024;
    } else {
      defaultSize = width * 0.024;
    }
//
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: defaultSize * 2), //20
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 1.5), //20
            child: TitleText(
              title: product.subTitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 1.5), //20
            child: Text(
              product.description,
            ),
          ),
          Container(
            padding: EdgeInsets.all(defaultSize * 1.5), //20
            width: width,
            height: 70,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: kPrimaryColor,
              onPressed: () {},
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: defaultSize * 1.8,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
