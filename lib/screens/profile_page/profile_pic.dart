// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../camera_method.dart';
// import 'dart:io';
//
//
// class ProfilePic extends StatefulWidget {
//   ProfilePic({required Key key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _ProfilePicState createState() => _ProfilePicState();
// }
//
// class _ProfilePicState extends State<ProfilePic> {
//   String? _imageFile;
//   String? imageUrl;
//   var _width;
//
//   File? _image;
//
//   _imgFromCamera() async {
//     onImageButtonPressed(
//       ImageSource.camera, context: context,
//       capturedImageFile: (s) {
//         print("file path  ${s}");
//         setState(() {
//           _image = File(s);
//         });
//       },
//     );
//   }
//
//   _imgFromGallery() async {
//     onImageButtonPressed(
//       ImageSource.gallery, context: context,
//       capturedImageFile: (s) {
//         print("file path  ${s}");
//         setState(() {
//           _image = File(s);
//         });
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body:
//       Center(
//         child: GestureDetector(
//           onTap: () {
//             _showPicker(context);
//           },
//           child: Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border:  Border.all(
//                 color: Colors.blue,
//                 width: 4.0,
//               ),
//
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                   //image: FileImage(_image!)
//                   image: _image != null ? FileImage(_image!) :  NetworkImage(
//                      'https://i.imgur.com/BoN9kdC.png'),
//
//                  // image: _image != null
//                  //     ? FileImage(_image!)
//                  //     : _image == null && imageUrl != null
//                  //     ?  NetworkImage("_imageUrl")
//
//
//               ),
//               ),
//             ),
//           ),
//         ),
//
//
//     );
//   }
//
//   Widget _previewImage(BuildContext context,) {
//     _width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     if (_imageFile != null) {
//       return Container(
//         height: _width * 0.34,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//           color: Colors.grey,
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.asset(
//             "${_imageFile}",
//             height: _width * 0.34,
//             width: _width,
//             alignment: Alignment.center,
//             fit: BoxFit.fitWidth,
//           ),
//         ),
//       );
//     } else {
//       return Container(
//         height: _width * 0.34,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//           color: Colors.grey,
//         ),
//         child: Center(
//           child: Image.asset(
//             'assets/images/wishlists/cam-img.png',
//             width: 24,
//             height: 20,
//           ),
//         ),
//       );
//     }
//   }
//
//
//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               child:  Wrap(
//                 children: <Widget>[
//                    ListTile(
//                       leading:  Icon(Icons.photo_library),
//                       title:  Text('Gallery'),
//                       onTap: () {
//                         _imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                    ListTile(
//                     leading:  Icon(Icons.photo_camera),
//                     title:  Text('Camera'),
//                     onTap: () {
//                       _imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }