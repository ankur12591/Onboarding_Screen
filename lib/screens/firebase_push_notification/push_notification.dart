import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';


class PushNotification extends StatefulWidget {
  const PushNotification({Key? key}) : super(key: key);

  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {

  late FirebaseMessaging messaging;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print("Firebase Device token: $value");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: Center(
        child: FlatButton(onPressed: () {  },
        child: Text("Push Notification", style: TextStyle(color: Colors.white,
            fontSize: 25)
        ),

        ),
      ),

    );
  }
}

