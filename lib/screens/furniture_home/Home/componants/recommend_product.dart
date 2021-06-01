import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/furniture_home/Details/details_screen.dart';
import 'package:onboarding_screen/screens/furniture_home/Home/componants/product_card.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Product.dart';
import 'package:onboarding_screen/screens/furniture_home/components/size_config.dart';

class RecommandProducts extends StatelessWidget {
  late double defaultSize;
  late Orientation orientation;
  late double height, width;

  final List<Product> products;

  RecommandProducts({required this.products});

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
      padding: EdgeInsets.all(defaultSize * 2),

      //color: Colors.orange,

      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Orientation.portrait == true ? 2 : 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.620,
        ),
        itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ));
            }),
      ),
    );
  }
}
