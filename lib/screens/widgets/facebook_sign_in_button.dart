import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/screens/sign_in/facebook_login_home_screen.dart';
import 'package:onboarding_screen/screens/user_info/user_info_screen.dart';
import 'package:onboarding_screen/services/authentication.dart';

class FacebookSignInButton extends StatefulWidget {
  @override
  _FacebookSignInButtonState createState() => _FacebookSignInButtonState();
}

class _FacebookSignInButtonState extends State<FacebookSignInButton> {
  String successMessage = '';
  bool _isSigningIn = false;

  //Facebook login async method

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  late String _message;

  // @override
  // void initState() {
  //   super.initState();
  //   _login().whenComplete((){
  //     setState(() {});
  //   });
  // }

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

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(() {
      _isSigningIn = true;
      // var _user = user ;
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : GestureDetector(
              onTap: () {
                //_login();
                // Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => SignInScreen()));
                setState(() {
                  _isSigningIn = true;
                });

                _login().then((user) {
                  if (user != null) {
                    print(
                        'Logged in successfully. \nYou are now navigated to Home Page.');
                    setState(() {
                      _isSigningIn = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FacebookSignInHomeScreen()));
                    });


                  } else {
                    print('Error while Login.');
                  }
                  setState(() {
                    _isSigningIn = false;
                  });
                });

              },
              child: Container(
                  height: 50.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: ImageIcon(
                                AssetImage('assets/icons/facebook.png'),
                                size: 22.0)),
                        SizedBox(width: 10.0),
                        Center(
                            child: Text('Login with facebook',
                                style: TextStyle(fontFamily: 'Trueno'))),
                      ],
                    ),
                  )),
            ),
    );
  }
}
