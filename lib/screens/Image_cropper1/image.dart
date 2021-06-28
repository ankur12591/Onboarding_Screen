


import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_image_cropper/camera_method.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../camera_method.dart';

// import 'image_cropper.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) ;

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _imageFile;
  var _width;

  File? _image;

  _imgFromCamera() async {
    onImageButtonPressed(
      ImageSource.camera, context: context,
      capturedImageFile: (s) {
        print("file path  ${s}");
        setState(() {
          _image = File(s);
        });
      },
    );
  }

  _imgFromGallery() async {
    onImageButtonPressed(
      ImageSource.gallery, context: context,
      capturedImageFile: (s) {
        print("file path  ${s}");
        print(_image);

        setState(() {
          _image = File(s);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Center(
        child: GestureDetector(
          onTap: () {
            _showPicker(context);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(
                color: Colors.blue,
                width: 4.0,
              ),

              image: new DecorationImage(
                fit: BoxFit.fill,
               // image: FileImage(_image!) ,
                image: _image != null
                    ?
                FileImage(_image!)
                    : new NetworkImage(
                    'https://i.imgur.com/BoN9kdC.png') as ImageProvider,

            //       image:  if (local != null) {
            // print(local.isEven);
            // }
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Container(
      //       width: 100.0,
      //       height: 50.0,
      //       child: FloatingActionButton.extended(
      //         label: Text("Camera"),
      //
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(50)),
      //
      //         onPressed: () {
      //           onImageButtonPressed(
      //             ImageSource.camera,
      //             context: context,
      //             capturedImageFile: (s) {
      //               setState(() {
      //                 _imageFile = s;
      //               });
      //             },
      //           );
      //         },
      //       ),
      //     ),
      //     Container(
      //       width: 100.0,
      //       height: 50.0,
      //       child: FloatingActionButton.extended(
      //         label: Text("Gallery"),
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(50)),
      //         onPressed: () {
      //           onImageButtonPressed(
      //             ImageSource.gallery, context: context,
      //             capturedImageFile: (s) {
      //               print("file path  ${s}");
      //               setState(() {
      //                 _imageFile = s;
      //               });
      //             },
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _previewImage(BuildContext context,) {
    _width = MediaQuery
        .of(context)
        .size
        .width;
    if (_imageFile != null) {
      return Container(
        height: _width * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "${_imageFile}",
            height: _width * 0.34,
            width: _width,
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    } else {
      return Container(
        height: _width * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/wishlists/cam-img.png',
            width: 24,
            height: 20,
          ),
        ),
      );
    }
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
                      title: new Text('Gallery'),
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
}