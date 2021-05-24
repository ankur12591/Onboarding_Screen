import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/components/socal_card.dart';
import 'package:onboarding_screen/screens/sign_up/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
                    "Register Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 0.08 * width,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.06),
                  SignUpForm(),
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
                  //SizedBox(height: height * 0.04),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: Text(
                      'By continuing your confirm that you agree \nwith our Term and Condition',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )

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
