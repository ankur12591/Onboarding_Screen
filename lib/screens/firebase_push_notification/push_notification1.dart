import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:overlay_support/overlay_support.dart';

class PushNotification1 extends StatefulWidget {
  const PushNotification1({Key? key}) : super(key: key);

  @override
  _PushNotification1State createState() => _PushNotification1State();
}

class _PushNotification1State extends State<PushNotification1> {
  late FirebaseMessaging messaging;

  // PushNotification? _notificationInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("Firebase Device token: $value");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      //FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // ...
      if (event.notification != null) {
        // For displaying the notification as an overlay
        showSimpleNotification(
          Text(event.notification!.body!),
          //leading: NotificationBadge(totalNotifications: _totalNotifications),
          //subtitle: Text(_notificationInfo!.body!),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2),
        );
      }
      //}
      //);

      print("Message recieved");
      // print(event.notification!.body);
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text("Notification"),
      //         content: Text(event.notification!.body!),
      //         actions: [
      //           TextButton(
      //             child: Text("Ok"),
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //           )
      //         ],
      //       );
      //     });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: Center(
        child: FlatButton(
          onPressed: () {},
          child: Text("Push Notification",
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }
}
