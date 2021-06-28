import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/screens/profile_page/common.dart';

import '../camera_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../camera_method.dart';
import 'dart:io';

import 'components/checkbox.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String? _chosenValue;

  late String _imageFile;
  var _width;

  File? _image;

  String? currentValue;

  _imgFromCamera() async {
    onImageButtonPressed(
      ImageSource.camera,
      context: context,
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
      ImageSource.gallery,
      context: context,
      capturedImageFile: (s) {
        print("file path  ${s}");
        setState(() {
          _image = File(s);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
        elevation: 20,
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              //  begin: Alignment.left,
              // end: Alignment.topRight,
              colors: [
                Colors.lightGreen,
                Colors.green,
              ]),
        )),
        backgroundColor: Colors.green,
        title: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Colors.lightGreen, Colors.green],
          //       // radius: 0.7,
          //     ),
          //     //shape: BoxShape.circle
          // ),
          child: Text(
            "My profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // GestureDetector(
                //   onTap: () {
                //     _showPicker(context);
                //   },
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     decoration: new BoxDecoration(
                //       shape: BoxShape.circle,
                //       border: new Border.all(
                //         color: Colors.blue,
                //         width: 4.0,
                //       ),
                //
                //       image: DecorationImage(
                //           fit: BoxFit.fill,
                //           image: FileImage(_image!)
                //         // image: _image != null ? FileImage(_image!)
                //         //     :
                //         //              : Image.network(
                //         // 'https://i.imgur.com/BoN9kdC.png'), as ImageProvider
                //         //  Object image: true ?
                //         //   FileImage(_image!)
                //         //       : NetworkImage(
                //         //   'https://i.imgur.com/BoN9kdC.png'), as ImageProvider
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
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
                            color: Colors.grey,
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
                      // Positioned(
                      //   right: -16,
                      //   bottom: 0,
                      //   child: SizedBox(
                      //     height: 46,
                      //     width: 46,
                      //     child: FlatButton(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(50),
                      //         side: BorderSide(color: Colors.white),
                      //       ),
                      //       color: Color(0xFFF5F6F9),
                      //       onPressed: () {},
                      //       child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelTitle(title: "Profile image"),
                  ],
                ),
              ],
            ),

            // ProfilePic(),
            SizedBox(height: 20),
            // ProfileMenu(
            //   text: "My Account",
            //   icon: "assets/icons/User Icon.svg",
            //   press: () => {
            //
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => MyAccount())),
            //
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => FAStepperExample ())),
            //   },
            // ),
            // ProfileMenu(
            //   text: "Notifications",
            //   icon: "assets/icons/Bell.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Settings",
            //   icon: "assets/icons/Settings.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Help Center",
            //   icon: "assets/icons/Question mark.svg",
            //   press: () {},
            // ),
            // ProfileMenu(
            //   text: "Log Out",
            //   icon: "assets/icons/Log out.svg",
            //   press: () {},
            // ),
            // Container(
            //   child: Text("Profile "),
            // ),
            // LabelTitle(title: "Name"),
            // // Second Element
            // Container(
            //   height: 70,
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: TextField(
            //     // controller: titleController,
            //     onSubmitted: (value) {
            //       // debugPrint('Textfield');
            //       // updateTitle();
            //       FocusScope.of(context).unfocus();
            //     },
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //         borderSide: BorderSide(
            //           color: Colors.grey.withOpacity(0.3),
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //         borderSide: BorderSide(color: Colors.redAccent),
            //       ),
            //     ),
            //   ),
            // ),
            LabelTitle(title: "Name"),
            CommonTextfield(),
            SizedBox(height: 20),
            LabelTitle(title: "Email"),
            CommonTextfield(),
            SizedBox(height: 20),
            LabelTitle(title: "Phone"),
            CommonTextfield(),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Container(
                child: Text(
                  "Shipping info",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 28,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            LabelTitle(title: "City"),
            // Container(
            //   height: 60,
            //   padding: const EdgeInsets.symmetric(vertical: 5.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: TextField(
            //           cursorColor: Colors.green,
            //           // controller: titleController,
            //           onSubmitted: (value) {
            //             // debugPrint('Textfield');
            //             // updateTitle();
            //             FocusScope.of(context).unfocus();
            //           },
            //           decoration: InputDecoration(
            //             enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //               borderSide: BorderSide(
            //                 color: Colors.grey.withOpacity(0.3),
            //               ),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //               borderSide: BorderSide(color: Colors.green),
            //             ),
            //           ),
            //         ),
            //       ),
            //       GestureDetector(
            //           onTap: () {},
            //           child: Icon(
            //             Icons.keyboard_arrow_down_rounded,
            //             color: Colors.black,
            //           ))
            //     ],
            //   ),
            // ),

            Container(
              height: 50,
              // margin:
              // EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    cursorColor: Colors.green,
                    style: TextStyle(color: Colors.white),
                    // controller: searchUsernameEditingController,
                    decoration: InputDecoration(
                        //filled: true,
                        //fillColor: Colors.white,

                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Search Username",
                        hintStyle: TextStyle(color: Colors.white)),
                  )),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
            //CommonTextfield(),

            SizedBox(height: 20),
            LabelTitle(title: "Address"),
            CommonTextfield(),
            SizedBox(height: 20),
            LabelTitle(title: "Zip code"),
            CommonTextfield(),
            SizedBox(height: 20),
            LabelTitle(title: "About me"),
            CommonTextfield(),
            SizedBox(height: 40),
            LabelTitle(title: "Interests"),
            SizedBox(height: 20),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                CustomCheckbox(
                  selectedIconColor: Colors.white,
                  selectedColor: Colors.green,
                  isChecked: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Text",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 18),

            SizedBox(height: 20),
            // LabelTitle(title: "City"),
            // SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width *0.6,
                  //   child: FlatButton(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5)),
                  //     color: Colors.green,
                  //     onPressed: () {},
                  //     child: Text(
                  //       "Save",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         //fontWeight: FontWeight.bold,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.green],
                        // radius: 0.7,
                      ),

                      // shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  Widget _previewImage(
    BuildContext context,
  ) {
    _width = MediaQuery.of(context).size.width;
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

class CustomDropDown extends StatelessWidget {
  final int value;
  final String hint;
  final String errorText;

  // final List<DropdownMenuItem> items;
  final Function onChanged;

  const CustomDropDown(
      {required this.value,
      required this.hint,
      //  required this.items,
      required this.onChanged,
      required this.errorText,
      required List<DropdownMenuItem<int>> items});

  @override
  Widget build(BuildContext context) {
    return Container(
        //   child: Container(
        //     decoration: BoxDecoration(
        //         color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
        //     child: Padding(
        //       padding:
        //       const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
        //       child: DropdownButton<int>(
        //         value: value,
        //         hint: Text(
        //           hint,
        //           style: TextStyle(fontSize: 20),
        //           overflow: TextOverflow.ellipsis,
        //         ),
        //         style: Theme.of(context).textTheme.title,
        //         items: <String>[
        //           'Android',
        //           'IOS',
        //           'Flutter',
        //           'Node',
        //           'Java',
        //           'Python',
        //           'PHP',
        //         ].map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       //  items: items,
        //         onChanged: (item) {
        //           onChanged(item);
        //         },
        //         isExpanded: true,
        //         underline: Container(),
        //         icon: Icon(Icons.keyboard_arrow_down),
        //       ),
        //     ),
        //   ),
        //     if (errorText != null)
        // Padding(
        //   padding: EdgeInsets.only(left: 30, top: 10),
        //   child: Text(errorText, style: TextStyle(fontSize: 12, color: Colors.red[800]),),
        // )
        //
        // ],
        );
  }
}
