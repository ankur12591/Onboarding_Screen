import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/components/title_text.dart';
import 'package:onboarding_screen/screens/furniture_home/constants.dart';
import 'package:onboarding_screen/screens/furniture_home/models/Categories.dart';
import 'package:onboarding_screen/screens/furniture_home/size_config.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  late double defaultSize;
  late Orientation orientation;
  late double height, width;

  @override
  Widget build(BuildContext context) {
    // double defaultSize = SizeConfig().defaultSize;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (Orientation.landscape == true) {
      defaultSize = height * 0.024;
    } else {
      defaultSize = width * 0.024;
    }

    return Container(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: Container(
        // color: Colors.orange,
        width: defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: MyShapeClippath(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title),
                        SizedBox(height: defaultSize),
                        Text(
                          "${category.numOfProducts}+ Products",
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: category.image,
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

class MyShapeClippath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    //path.moveTo(0, height * 0.15);
    //path.quadraticBezierTo(width, 0, width - cornerSize, 0);

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.45);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 1.8);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
