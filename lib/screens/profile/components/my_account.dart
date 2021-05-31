import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
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
                  _showPicker(context);
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

    //   Scaffold(
    //   body: Container(
    //     //color: Colors.deepOrangeAccent,
    //     child: Column(
    //       children: <Widget>[
    //         SizedBox(
    //           height: 32,
    //         ),
    //         Center(
    //           child: Container(
    //             color: Colors.deepOrangeAccent,
    //             child: GestureDetector(
    //               onTap: () {
    //                 _showPicker(context);
    //               },
    //               child: CircleAvatar(
    //                 radius: 55,
    //                 backgroundColor: Colors.blueGrey,
    //                 child: _imageFile != null
    //                     ? ClipRRect(
    //                         borderRadius: BorderRadius.circular(50),
    //                         child: Image.file(
    //                           File(_imageFile!.path),
    //                           // _image,
    //                           width: 100,
    //                           height: 100,
    //                           fit: BoxFit.fitHeight,
    //                         ),
    //                       )
    //                     : Container(
    //                         decoration: BoxDecoration(
    //                             color: Colors.grey[200],
    //                             borderRadius: BorderRadius.circular(50)),
    //                         width: 100,
    //                         height: 100,
    //                         child: Icon(
    //                           Icons.camera_alt,
    //                           color: Colors.grey[800],
    //                         ),
    //                       ),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    //   SizedBox(
    //   height: 115,
    //   width: 115,
    //   child: Stack(
    //     fit: StackFit.expand,
    //     overflow: Overflow.visible,
    //     children: [
    //       Container(
    //         height: 100,
    //         width: MediaQuery.of(context).size.width,
    //         decoration: BoxDecoration(
    //             color: Colors.blueGrey,
    //             borderRadius: BorderRadius.circular(60)),
    //         child: Icon(
    //           Icons.add_a_photo_rounded,
    //           color: Colors.black26,
    //           size: 40,
    //         ),
    //       ),
    //
    //     // // CircleAvatar(
    //       // //   backgroundImage: AssetImage("assets/images/Profile Image.png"),
    //       // // ),
    //       Positioned(
    //         right: -16,
    //         bottom: 0,
    //         child: SizedBox(
    //           height: 46,
    //           width: 46,
    //           child: FlatButton(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(50),
    //               side: BorderSide(color: Colors.white),
    //             ),
    //             color: Color(0xFFF5F6F9),
    //             onPressed: () {},
    //             child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
