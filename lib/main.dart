import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/splash/splash.dart';
import 'package:onboarding_screen/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
     // initialRoute: SplashScreen.routeName,
     // routes: routes,
    );
  }
}

