import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/complete_profile/complete_profile_form.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  static String routeName = "/complete_profile";
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 0.06 * width,),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.04),
                  Text("Complete Profile", style: TextStyle(
                    fontSize: width * 0.075 ,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5,
                  )),
                  Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height *  0.06),
                  CompleteProfileForm(),
                  SizedBox(height: height * 0.04),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}