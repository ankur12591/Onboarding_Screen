import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/components/default_button.dart';
import 'package:onboarding_screen/screens/components/socal_card.dart';
import 'package:onboarding_screen/screens/sign_in/sign_in_form.dart';
import 'package:onboarding_screen/screens/sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.06 * width,
              //getProportionateScreenWidth(20)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 0.08 * width,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.06),
                  SignInForm(),
                  SizedBox(height: height * 0.02),
                  Container(
                    //color: Colors.amber,
                    child: Container(
                      //padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocalCard(
                            icon: "assets/icons/google-icon.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {},
                          ),
                          // SocalCard(
                          //   icon: "assets/icons/twitter.svg",
                          //   press: () {},
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: height * 0.04),
                  Container(
                    //color: Colors.amber,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),

                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(fontSize: width * 0.044),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen())),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: width * 0.044, color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //SizedBox(height: 0.03 * height,),
                  // NoAccountText(),
                  // SizedBox(height: height * 0.08),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
