import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/profile/components/profile_menu.dart';

class Pic extends StatefulWidget {
  @override
  State<Pic> createState() => _PicState();
}

class _PicState extends State<Pic> {
  PickedFile? _image;

  final picker = ImagePicker();

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  _imgFromGallery() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child:  Wrap(
                children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                        leading:  Icon(Icons.photo_library, color: kPrimaryColor,),
                        trailing: Icon(Icons.arrow_forward_ios,color: CustomColors.firebaseNavy),
                        title:  Text('Photo Gallery',style: TextStyle(color: CustomColors.firebaseNavy),),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                      leading:  Icon(Icons.photo_camera,color: kPrimaryColor,),
                      trailing: Icon(Icons.arrow_forward_ios,color: CustomColors.firebaseNavy),
                      title:  Text('Camera',style: TextStyle(color: CustomColors.firebaseNavy),),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                  ),
                   ),
                ],
              ),
            ),
          );
        });
  }

  // static List<String> picOptionlist = <String>['Photo Gallery', 'Camera'];
  // static List iconList = ['Icons.photo_library', 'Icons.photo_camera'];

  void _showPickerListview(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    height: 100,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  ListTile(
                              leading:  Icon(Icons.photo_library, color: kPrimaryColor,),
                              trailing: Icon(Icons.arrow_forward_ios,color: CustomColors.firebaseNavy),
                              title:  Text('Photo Gallery',style: TextStyle(color: CustomColors.firebaseNavy),),
                              onTap: () {
                                _imgFromGallery();
                                Navigator.of(context).pop();
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  ListTile(
                            leading:  Icon(Icons.photo_camera,color: kPrimaryColor,),
                            trailing: Icon(Icons.arrow_forward_ios,color: CustomColors.firebaseNavy),
                            title:  Text('Camera',style: TextStyle(color: CustomColors.firebaseNavy),),
                            onTap: () {
                              _imgFromCamera();
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.deepOrangeAccent,
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 32,
          // ),
          Center(
            child: Container(
              // color: Colors.deepOrangeAccent,
              child: GestureDetector(
                onTap: () {
                 // _showPicker(context);
                  _showPickerListview(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blueGrey,
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(_imageFile!.path),
                            // _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
