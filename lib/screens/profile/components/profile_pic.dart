import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/services/crud.dart';
import 'package:random_string/random_string.dart';

class ProfilePic extends StatefulWidget {
  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late User _user;

  bool _isLoading = false;

  CrudMethods crudMethods = CrudMethods();
  late String imageUrl;
  late File _selectedImage;
  final picker = ImagePicker();



  @override
  void initState() {
    super.initState();
    // _selectedImage;
  }

  // Future<void> uploadBlog() async {
  //   if (_selectedImage != null) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //
  //     // Upload Image to Firebase Storage
  //
  //     Reference firebaseStorageRef = FirebaseStorage.instance
  //         .ref()
  //         .child("profilePic")
  //         .child("${randomAlphaNumeric(9)}.jpg");
  //
  //     final UploadTask task = firebaseStorageRef.putFile(_selectedImage);
  //
  //     await task.whenComplete(() async {
  //       try {
  //         imageUrl = await firebaseStorageRef.getDownloadURL();
  //       } catch (e) {
  //         print(e);
  //       }
  //     });
  //
  //     Map<String, dynamic> profileMap = {
  //       "imageUrl": imageUrl,
  //     };
  //
  //     FirebaseFirestore.instance
  //         .collection("profile")
  //         .add(profileMap)
  //         .catchError((onError) {
  //       print("facing an issue while uploading data to firestore : $onError");
  //     });
  //
  //     // crudMethods.addData(profileMap).then((result) {
  //     Navigator.pop(context);
  //     //});
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(60)),
            child: Icon(
              Icons.add_a_photo_rounded,
              color: Colors.black26,
              size: 40,
            ),
          ),

          // // CircleAvatar(
          // //   backgroundImage: AssetImage("assets/images/Profile Image.png"),
          // // ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
