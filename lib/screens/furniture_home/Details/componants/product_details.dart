import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/screens/furniture_home/constants.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Product.dart';
import 'package:onboarding_screen/screens/furniture_home/size_config.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({required this.product});

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

    return Container(
      height: 300,
      //height: SizeConfig.defaultSize * 37.5, //375
      width: 140,
      //color: Colors.green,
      //color: Color(0xffEEEFF2),
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(defaultSize * 2),
      //20

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            //  "Aristocratic Hand Bag",
            product.category,
            style: TextStyle(color: kTextColor.withOpacity(0.6), fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: defaultSize * 2.4, //24
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
          ),
          // SizedBox(
          //   height: 100,
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Form\n",
                      style: TextStyle(color: kTextColor.withOpacity(0.6))),
                  TextSpan(
                    text: "\$${product.price}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Text("Available Colors",
              style: TextStyle(color: kTextColor.withOpacity(0.6))),
          Row(
            children: <Widget>[
              buildColorBox(
                defaultSize,
                color: Color(0xFF7BA275),
                isActive: true,
              ),
              buildColorBox(
                defaultSize,
                color: Color(0xFFD7D7D7),
              ),
              buildColorBox(
                defaultSize,
                color: kTextColor,
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {required Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      // For  fixed value we can use cont for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
