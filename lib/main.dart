import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/calender/calender.dart';
import 'package:onboarding_screen/screens/image_cropper/image_cropper1.dart';
import 'package:onboarding_screen/screens/search_module/search_module.dart';
import 'package:onboarding_screen/screens/splash/splash_with_animation.dart';
import 'package:onboarding_screen/theme.dart';
import 'package:overlay_support/overlay_support.dart';

import 'screens/calender/calender_with_add_event/calender_with_shared_pref.dart';

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
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home:
     //   SearchModuleExample(),

        //TableEventsExample(),
        //DynamicEvent(),
        //Calendar(),
        //HomeCalendarPage(),
            // SearchModuleExample2(),
           // SearchModuleExample(),
        ImageCropper1(title: 'Image Cropper',),
//        SplashScreen1(),
        // We use routeName so that we dont need to remember the name
       //  initialRoute: SplashScreen.routeName,
         //routes: routes,
      ),
    );
  }
}
