import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
   // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      // body: SizedBox(
      //   width: double.infinity,
      //   child: Padding(
      //     padding:
      //     EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           SizedBox(height: SizeConfig.screenHeight * 0.05),
      //           Text(
      //             "OTP Verification",
      //             style: headingStyle,
      //           ),
      //           Text("We sent your code to +1 898 860 ***"),
      //           buildTimer(),
      //           OtpForm(),
      //           SizedBox(height: SizeConfig.screenHeight * 0.1),
      //           GestureDetector(
      //             onTap: () {
      //               // OTP code resend
      //             },
      //             child: Text(
      //               "Resend OTP Code",
      //               style: TextStyle(decoration: TextDecoration.underline),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
