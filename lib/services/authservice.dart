// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:onboarding_screen/new_facebook/error_handler.dart';
// import 'package:onboarding_screen/new_facebook/home_page.dart';
// import 'package:onboarding_screen/new_facebook/login_page.dart';
//
// class AuthService {
//   //Determine if the user is authenticated.
//   handleAuth() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return HomePage();
//           } else
//             return LoginPage();
//         });
//   }
//
//   //Sign out
//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }
//
//   //Sign In
//   signIn(String email, String password, context) {
//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password)
//         .then((val) {
//       print('signed in');
//     }).catchError((e) {
//       ErrorHandler().errorDialog(context, e);
//     });
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//
//   //fb signin
//
//   fbSignIn() async {
//     final fb = FacebookLogin();
//
// // Log in
//     final res = await fb.logIn(['email', 'public_profile']);
//
//
//
//     // Check result status
//     switch (res.status) {
//       case FacebookLoginStatus.loggedIn:
//       // Logged in
//
//       // Send access token to server for validation and auth
//         final FacebookAccessToken accessToken = res.accessToken;
//         print('Access token: ${accessToken.token}');
//
//         // Get profile data
//         final profile = await fb.getUserProfile();
//         print('Hello, ${profile.name}! You ID: ${profile.userId}');
//
//         // Get user profile image url
//         final imageUrl = await fb.getProfileImageUrl(width: 100);
//         print('Your profile image: $imageUrl');
//
//         // Get email (since we request email permission)
//         final email = await fb.;
//         // But user can decline permission
//         if (email != null)
//           print('And your email is $email');
//
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//       // User cancel log in
//         break;
//       case FacebookLoginStatus.error:
//       // Log in failed
//         print('Error while log in: ${res.errorMessage}');
//         break;
//     }
//
//
//
//
//
//
//
//
//
// // Check result status
//
//
//     final FacebookLoginResult result = await fb.logIn(['email', 'public_profile']);
//     switch (result.status) {
//       case FacebookLoginStatus.cancelledByUser:
//
//         break;
//       case FacebookLoginStatus.error:
//       // Log in failed
//         print('Error while log in: ${res.errorMessage}');
//         break;
//       case FacebookLoginStatus.loggedIn:
//         try {
//           await loginWithfacebook(result);
//         } catch (e) {
//           print(e);
//         }
//         break;
//     }
//   }
//
//
//
//
//   Future loginWithfacebook(FacebookLoginResult result) async {
//     final FacebookAccessToken accessToken = result.accessToken;
//     AuthCredential credential =
//     FacebookAuthProvider.credential(accessToken.token);
//
//
//
//
//     // var user = await _auth.signInWithCredential(credential);
//     // setState(() {
//     //   _isSigningIn = true;
//     //   _user = user as User;
//     // });
//   }
//
//
//
//
//
//   Future<User> facebookLogin(BuildContext context) async {
//     User currentUser;
//     // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
//     // if you remove above comment then facebook login will take username and pasword for login in Webview
//     try {
//       final FacebookLoginResult facebookLoginResult =
//       await fb.logInWithReadPermissions(['email', 'public_profile']);
//       if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
//         FacebookAccessToken facebookAccessToken =
//             facebookLoginResult.accessToken;
//         final AuthCredential credential = FacebookAuthProvider.Credential(
//             accessToken: facebookAccessToken.token);
//         final User user = await auth.signInWithCredential(credential);
//         assert(user.email != null);
//         assert(user.displayName != null);
//         assert(!user.isAnonymous);
//         assert(await user.getIdToken() != null);
//         currentUser = await auth().currentUser();
//         assert(user.uid == currentUser.uid);
//         return currentUser;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return currentUser;
//   }
//
//
//
//
//
//
//
//   //Signup a new user
//   signUp(String email, String password) {
//     return FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password);
//   }
//
//   //Reset Password
//   resetPasswordLink(String email) {
//     FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//   }
// }