import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/enums.dart';
import 'package:onboarding_screen/screens/components/coustom_bottom_nav_bar.dart';
import 'package:onboarding_screen/screens/profile/components/my_account.dart';
import 'package:onboarding_screen/screens/stepper/stepper1.dart';
import 'package:onboarding_screen/screens/stepper/stepper2.dart';
import 'package:onboarding_screen/screens/stepper/stepper2/home.dart';
import 'package:onboarding_screen/screens/stepper/stepper3.dart';
import 'package:onboarding_screen/screens/stepper/stepper4.dart';
import 'package:onboarding_screen/screens/stepper/stepper5.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatefulWidget {
  //static String routeName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => MyAccount())),

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FAStepperExample ())),
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
