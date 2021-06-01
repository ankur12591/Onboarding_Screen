import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/enums.dart';
import 'package:onboarding_screen/screens/components/coustom_bottom_nav_bar.dart';
import 'package:onboarding_screen/screens/furniture_home/Home/furniture_home.dart';

class HomeScreen extends StatelessWidget {
  //static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FurnitureHome(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
