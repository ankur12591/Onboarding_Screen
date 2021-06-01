import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/screens/furniture_home/Details/componants/product_description.dart';
import 'package:onboarding_screen/screens/furniture_home/Details/componants/product_details.dart';
import 'package:onboarding_screen/screens/furniture_home/constants.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  DetailsScreen({required this.product});

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
    return Scaffold(
      backgroundColor: Color(0xffEEEFF2),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow-long-left.svg",
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(""),
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/bag.svg",
                color: kTextColor,
              ),
              onPressed: () {}),
          SizedBox(
            width: defaultSize,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.all(8),
          width: double.infinity,
          height: Orientation.landscape == true
              ? width
              : height - AppBar().preferredSize.height,
          child: Stack(
            children: [
              ProductDetails(product: product),
              Positioned(
                top: defaultSize * 35.5,
                left: 0,
                right: 0,
                child: ProductDescription(
                  product: product,
                ),
              ),
              Positioned(
                top: defaultSize * 9.5,
                right: -defaultSize * 7.5,
                child: Hero(
                  tag: product.id,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    height: defaultSize * 37.8, //378
                    width: defaultSize * 36.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
