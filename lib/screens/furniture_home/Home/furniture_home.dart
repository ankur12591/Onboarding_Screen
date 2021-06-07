import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/base_project/common/enums.dart';
import 'package:onboarding_screen/screens/components/coustom_bottom_nav_bar.dart';
import 'package:onboarding_screen/screens/components/title_text.dart';
import 'package:onboarding_screen/screens/furniture_home/Services/fetchCategories.dart';
import 'package:onboarding_screen/screens/furniture_home/Services/fetchProducts.dart';
import 'package:onboarding_screen/screens/furniture_home/components/constants.dart';
import 'package:onboarding_screen/screens/furniture_home/components/size_config.dart';
import 'componants/categories.dart';
import 'componants/recommend_product.dart';

class FurnitureHome extends StatefulWidget {
  @override
  _FurnitureHomeState createState() => _FurnitureHomeState();
}

class _FurnitureHomeState extends State<FurnitureHome> {
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
    // double defaultSize = SizeConfig().init(context).;

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            //  height: defaultSize,
            height: height,
          ),
          onPressed: () {},
        ),
        title: Text(""),
        actions: [
          IconButton(
              icon: SvgPicture.asset(
                "assets/icons/scan.svg",
                color: kTextColor,
                // height: height * 2.4,
                height: defaultSize * 2.4,
              ),
              onPressed: () {}),
          Center(
            child: Text(
              "Scan",
              style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              //  width: .defaultSize,
              )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: width,
          //height: height ,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Made by  ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        // fontWeight: FontWeight.w300
                      ),
                    ),
                    Text(
                      "Ankur Sutariya",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              //SizedBox(height: 16.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    // padding: EdgeInsets.all(defaultSize * 2),
                    //padding: EdgeInsets.all(height * 2),//20
                    // padding: EdgeInsets.all(8),
                    child: TitleText(
                      title: "Browse by Categories",
                    ),
                  ),
                  FutureBuilder(
                    future: fetchCategories(),
                    builder: (context, AsyncSnapshot snapshot) =>
                        snapshot.hasData
                            ? Categories(categories: snapshot.data)
                            : Center(child: Image.asset("assets/ripple.gif")),
                  ),
                  Divider(height: 5),
                  Container(
                    // padding: EdgeInsets.symmetric(vertical :SizeConfig.defaultSize * 2), //20
                    padding: EdgeInsets.all(defaultSize * 2), //20
                    // padding: EdgeInsets.all(height * 2),
                    child: TitleText(title: "Recommends For You"),
                  ),
                  // TitleText(title: "Recommends For You",),
                  FutureBuilder(
                    future: fetchProducts(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? Container(

                       // color: Colors.orange,
                            child: RecommandProducts(
                                products: snapshot.data,
                              ),
                          )
                          : Center(child: Image.asset('assets/ripple.gif'));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
