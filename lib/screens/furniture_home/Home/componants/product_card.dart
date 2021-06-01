import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/components/title_text.dart';
import 'package:onboarding_screen/screens/furniture_home/components/constants.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Product.dart';
import 'package:onboarding_screen/screens/furniture_home/components/size_config.dart';
import 'dart:core';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  ProductCard({required this.product, required this.press});

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

    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5, //145
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(title: product.title),
              ),
              SizedBox(height: defaultSize / 2),
              Text("\$${product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
