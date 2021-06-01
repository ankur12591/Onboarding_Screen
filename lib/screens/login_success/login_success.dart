import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/components/default_button.dart';
import 'package:onboarding_screen/screens/furniture_home/Home/furniture_home.dart';

class LoginSuccessScreen extends StatelessWidget {
  //static String routeName = "/login_success";
  late double height, width;
  late double defaultSize;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   //leading: SizedBox(),
      //
      // ),
      body: SingleChildScrollView(

        child: Container(height: height,
       // color: Colors.deepOrangeAccent,
          width: width,
          margin: EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login Success",textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: CustomColors.firebaseNavy.withOpacity(0.9),),),
                ],
              ),
              SizedBox(height: height * 0.04),
              Container(
               // color: Colors.deepOrangeAccent,
                child: Image.asset(
                  "assets/images/success.png",
                  height: height * 0.4, //40%
                ),
              ),
              SizedBox(height: height * 0.08),
              Text(
                "Login Success",
                style: TextStyle(
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.firebaseNavy.withOpacity(0.8),
                ),
              ),
              Spacer(),
              SizedBox(
                width: width * 0.6,
                child: DefaultButton(
                  text: "Back to home",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FurnitureHome()));

                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
