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
  _FacebookSignInHomeScreenState createState() =>
      _FacebookSignInHomeScreenState();
}

class _FacebookSignInHomeScreenState extends State<FacebookSignInHomeScreen> {
  bool _isSigningIn = false;
  var profileData;

  late User _user;

  //Facebook login async method

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  late String _message;

  void onLoginStatusChanged(bool _isSigningIn, {profileData}) {
    setState(() {
      this._isSigningIn = _isSigningIn;
      this.profileData = profileData;
    });
  }

  void initiateFacebookLogin() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final String token = result.accessToken.token;
        final response = await http.get(Uri.parse(
            //'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${result.accessToken.token}'));
//        final profile = jsonDecode(response.body);
        final profile = Map<String, dynamic>.from(json.decode(response.body));

        print(profile.toString());
        //return profile;

        onLoginStatusChanged(true, profileData: profile);
        break;

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
          padding: const EdgeInsets.symmetric(vertical: 48.0),
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

              // Container(
              //   height: 200.0,
              //   width: 200.0,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: NetworkImage(
              //         profileData['picture']['data']['url'],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 28.0),
              // Text(
              //   "Logged in as: ${profileData['name']}",
              //   style: TextStyle(
              //     fontSize: 20.0,
              //   ),
              // ),

              // _displayUserData(profileData),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: Text(
                  'You are now signed in using your Facebook account. '
                  'To sign out of your account click the "Sign Out" button below.',
                  textAlign: TextAlign.center,
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
                        print(
                            'Logged out successfully. \nYou can now navigate to Home Page.');

                        //signOutFacebook();

                        _logOut();
                        Navigator.pop(context);
                      },
                      color: CustomColors.firebaseNavy.withOpacity(0.9),
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
    );
  }

  _displayUserData(profileData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Container(
        //   height: 200.0,
        //   width: 200.0,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: NetworkImage(
        //         profileData['picture']['data']['url'],
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: 28.0),
        // Text(
        //   "Logged in as: ${profileData}",
        //   style: TextStyle(
        //     fontSize: 20.0,
        //   ),
        // ),
      ],
    );
  }
}
