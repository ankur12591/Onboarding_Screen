import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/widgets/google_sign_in_button.dart';
import 'package:onboarding_screen/services/authentication.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class FacebookSignInHomeScreen extends StatefulWidget {
  @override
  _FacebookSignInHomeScreenState createState() => _FacebookSignInHomeScreenState();
}

class _FacebookSignInHomeScreenState extends State<FacebookSignInHomeScreen> {
  bool _isSigningIn = false;

  late User _user;

  //Facebook login async method

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  late String _message;

  Future<dynamic> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final String token = result.accessToken.token;
        final response = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
//        final profile = jsonDecode(response.body);
        final profile = Map<String, dynamic>.from(json.decode(response.body));

        print(profile);
        return profile;

      // _showMessage('''
      //  Logged in!
      //
      //  Token: ${accessToken.token}
      //  User id: ${accessToken.userId}
      //
      //  Expires: ${accessToken.expires}
      //  Permissions: ${accessToken.permissions}
      //  Declined permissions: ${accessToken.declinedPermissions}
      //  ''');
      // break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');

        facebookSignIn.loginBehavior = FacebookLoginBehavior.webViewOnly;
        break;

      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<void> _logOut() async {
    await facebookSignIn.logOut();
    print(
        'User Logged out. Logged out successfully. \nYou are now navigated to Home Page."');
  }

  void _showMessage(String message) {
    setState(() {
      _isSigningIn = false;
      // var _user = user ;
      _message = message;
    });
  }

  // void signOutFacebook() async{
  //   await facebookSignIn.logOut();
  //   //await _googleSignIn.signOut();
  //   print("User Sign Out. Logged out successfully. \nYou are now navigated to Home Page.");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColors.firebaseNavy,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical:48.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text(
                  'Welcome User',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              SizedBox(height: 40),
              Image.asset(
                "assets/images/girl.jpg",
                scale: 5,
              ),
              //SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
                child: Text(
                  'You are now signed in using your Google account. '
                  'To sign out of your account click the "Sign Out" button below.', textAlign: TextAlign.center,
                  style: TextStyle(
                      color: CustomColors.firebaseNavy.withOpacity(0.9),
                      fontSize: 14,
                      letterSpacing: 0.2),
                ),
              ),
              // CircleAvatar(
              //   radius: 80,
              //   backgroundImage: NetworkImage(.photoURL),
              // ),
              // Text(
              //   profile.displayName,
              //   style: TextStyle(fontSize: 30),
              // ),
              _isSigningIn
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      onPressed: () {
                        // _logOut();
                        // print(
                        //     'Logged out successfully. \nYou can now navigate to Home Page.');

                        //signOutFacebook();

                        _logOut();
                        Navigator.pop(context);
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(builder: (context) {
                        //   return SignInScreen();
                        // }), ModalRoute.withName('/'));

                        // _logOut().then((user) {
                        //   print(
                        //       'Logged out successfully. \nYou can now navigate to Home Page.');
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SignInScreen()));
                        //
                        //   print('Error while LogOut.');
                        // });

                        // _logOut().then((user) {
                        //   if (user != null) {
                        //     print(
                        //         'Logged out successfully. \nYou can now navigate to Home Page.');
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => SignInScreen()));
                        //   } else {
                        //     print('Error while LogOut.');
                        //   }
                        // });
                      },
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
              //
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.only(
      //       left: 16.0,
      //       right: 16.0,
      //       bottom: 20.0,
      //     ),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         Row(),
      //         Expanded(
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Flexible(
      //                 flex: 1,
      //                 child: Image.asset(
      //                   'assets/firebase_logo.png',
      //                   height: 160,
      //                 ),
      //               ),
      //               SizedBox(height: 20),
      //               Text(
      //                 'FlutterFire',
      //                 style: TextStyle(
      //                   color: CustomColors.firebaseYellow,
      //                   fontSize: 40,
      //                 ),
      //               ),
      //               Text(
      //                 'Authentication',
      //                 style: TextStyle(
      //                   color: CustomColors.firebaseOrange,
      //                   fontSize: 40,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         FutureBuilder(
      //           future: Authentication.initializeFirebase(context: context),
      //           builder: (context, snapshot) {
      //             if (snapshot.hasError) {
      //               return Text('Error initializing Firebase');
      //             } else if (snapshot.connectionState == ConnectionState.done) {
      //               return GoogleSignInButton();
      //             }
      //             return CircularProgressIndicator(
      //               valueColor: AlwaysStoppedAnimation<Color>(
      //                 CustomColors.firebaseOrange,
      //               ),
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
