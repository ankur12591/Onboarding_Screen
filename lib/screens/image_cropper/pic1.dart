import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/profile/components/profile_menu.dart';

class ImageCropperWithCamAndGallery extends StatefulWidget {
  @override
  State<ImageCropperWithCamAndGallery> createState() => _ImageCropperWithCamAndGalleryState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class _ImageCropperWithCamAndGalleryState extends State<ImageCropperWithCamAndGallery> {
  PickedFile? _image;
  late AppState state;

  final picker = ImagePicker();

 // PickedFile? _imageFile;
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
    );

    setState(() {
     // _imageFile = pickedFile
      _imageFile = pickedFile as File?;

    });
  }

  _imgFromGallery() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );


    setState(() {
      _imageFile =
          //pickedFile
      File(pickedFile!.path);
     // _imageFile = pickedFile as File?;

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


  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: _imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
        ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
        ]
        : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
     // _imageFile = croppedFile as PickedFile?;
      _imageFile = croppedFile ;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state = AppState.free;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.deepOrangeAccent,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              // color: Colors.deepOrangeAccent,
              child: GestureDetector(
                onTap: () {
                 // _showPicker(context);
                  if (state == AppState.free)
                 {   _showPickerListview(context);
                  setState(() {
                    state = AppState.picked;
                  }); }
                  else if (state == AppState.picked)
                    _cropImage();

               //   else if (state == AppState.cropped) _clearImage();

                //  _showPickerListview(context);
                  // setState(() {
                  //   state = AppState.picked;
                  // });
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
