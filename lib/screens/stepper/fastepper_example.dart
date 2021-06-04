import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fa_stepper/fa_stepper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/profile/components/pic.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:core';
import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding_screen/screens/profile/show_dialog/custom_dialog_box.dart';
import 'package:onboarding_screen/services/crud.dart';
import 'package:random_string/random_string.dart';

class FAStepperExample extends StatefulWidget {
  @override
  _FAStepperExampleState createState() => _FAStepperExampleState();
}

class _FAStepperExampleState extends State<FAStepperExample> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String firstName;

  bool remember = false;
  late double height, width;
  final List<String> errors = [];
  List<String> demoList = [];

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alternateEmailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController alternateMobileNoController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  PickedFile? _image;
  CrudMethods crudMethods = CrudMethods();

  final picker = ImagePicker();

  //late File _imageFile;
  late PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  late String imageUrl;

  _imgFromCamera() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
    );
    setState(() {
      //_imageFile = File(pickedFile!.path);
      _imageFile = pickedFile;
    });
  }

  _imgFromGallery() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
     // _imageFile = File(pickedFile!.path);
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

  // void uploadBlog() async {
  //   if (_imageFile != null) {
  //     setState(() {
  //    //   _isLoading = true;
  //     });
  //
  //     // Upload Image to Firebase Storage
  //
  //     Reference firebaseStorageRef = FirebaseStorage.instance
  //         .ref()
  //         .child("blogImages")
  //         .child("${randomAlphaNumeric(9)}.jpg");
  //
  //     final UploadTask task = firebaseStorageRef.putFile(_imageFile);
  //
  //     await task.whenComplete(() async {
  //       try {
  //         imageUrl = await firebaseStorageRef.getDownloadURL();
  //       } catch (e) {
  //         print(e);
  //       }
  //     });
  //
  //     Map<String, dynamic> blogMap = {
  //       "imageUrl": imageUrl,
  //
  //     };
  //
  //     FirebaseFirestore.instance
  //         .collection("blogs")
  //         .add(blogMap)
  //         .catchError((onError) {
  //       print("facing an issue while uploading data to firestore : $onError");
  //     });
  //
  //     // crudMethods.addData(blogMap).then((result) {
  //     Navigator.pop(context);
  //     //});
  //   } else {}
  // }

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  String title = 'My Profile Stepper';

  int _currentStep = 0;

  FAStepperType _stepperType = FAStepperType.vertical;

  _switchStepType() {
    setState(() => _stepperType == FAStepperType.vertical
        ? _stepperType = FAStepperType.horizontal
        : _stepperType = FAStepperType.vertical);
  }

  List<FAStep> _stepper() {
    List<FAStep> _mystepper = [
      FAStep(
        title: Text(
          'Profile Pic',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        isActive: true,
        //isActive: true,
        state: FAStepstate.indexed,
        //state: FAStepstate.complete,
        content: Column(
          children: <Widget>[
             Pic(),

            // Container(
            //   //color: Colors.deepOrangeAccent,
            //   child: Column(
            //     children: <Widget>[
            //       // SizedBox(
            //       //   height: 32,
            //       // ),
            //       Center(
            //         child: Container(
            //           // color: Colors.deepOrangeAccent,
            //           child: GestureDetector(
            //             onTap: () {
            //               _showPicker(context);
            //             },
            //             child: CircleAvatar(
            //               radius: 55,
            //               backgroundColor: Colors.blueGrey,
            //               child: _imageFile != null
            //                   ? ClipRRect(
            //                       borderRadius: BorderRadius.circular(50),
            //                       child: Image.file(
            //                         File(_imageFile!.path),
            //                         // _image,
            //                         width: 100,
            //                         height: 100,
            //                         fit: BoxFit.fitHeight,
            //                       ),
            //                     )
            //                   : Container(
            //                       decoration: BoxDecoration(
            //                           color: Colors.grey[200],
            //                           borderRadius: BorderRadius.circular(50)),
            //                       width: 100,
            //                       height: 100,
            //                       child: Icon(
            //                         Icons.camera_alt,
            //                         color: Colors.grey[800],
            //                       ),
            //                     ),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Last Name'),
            // ),
          ],
        ),
      ),
      FAStep(
        title: Text(
          'Name',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        isActive: true,
        state: FAStepstate.indexed,
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                    child: Icon(Icons.person),
                    // child: SvgPicture.asset(
                    //   "assets/icons/Mail.svg",
                    //   height: 15,
                    // ),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: lastNameController,
              onChanged: (value) {
                //  authorName = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Last Name",
                hintText: "Enter your last name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: Icon(Icons.person),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Mail.svg",
                  //   height: 15,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
      FAStep(
        title: Text(
          'Email',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        isActive: true,
        state: FAStepstate.indexed,
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: emailController,
                onChanged: (value) {
                  //email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                    child: SvgPicture.asset(
                      "assets/icons/Mail.svg",
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: alternateEmailController,
              onChanged: (value) {
                // authorName = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Recovery Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: SvgPicture.asset(
                    "assets/icons/Mail.svg",
                    height: 15,
                  ),
                ),
              ),
            ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Recovery Email'),
            // ),
          ],
        ),
      ),
      FAStep(
        title: Text(
          'Mobile No.',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        isActive: true,
        state: FAStepstate.indexed,
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: mobileNoController,
                onChanged: (value) {
                  // authorName = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Mobile No.",
                  hintText: "Enter your mobile no.",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                    child: Icon(Icons.phone_iphone_rounded),
                    // child: SvgPicture.asset(
                    //   "assets/icons/Mail.svg",
                    //   height: 15,
                    // ),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: alternateMobileNoController,
              onChanged: (value) {
                //  authorName = value;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Alternate Mobile No.",
                hintText: "Enter your mobile no",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: Icon(Icons.phone_iphone_rounded),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Mail.svg",
                  //   height: 15,
                  // ),
                ),
              ),
            ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Mobile No.'),
            // ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Alternative Mobile No.'),
            // ),
          ],
        ),
      ),
      FAStep(
        title: Text(
          'Address',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        isActive: true,
        state: FAStepstate.indexed,
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: address1Controller,
                onChanged: (value) {
                  // authorName = value;
                },
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  labelText: "Address 1",
                  hintText: "Enter your address",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                    child: Icon(Icons.add_location),
                    // child: SvgPicture.asset(
                    //   "assets/icons/Mail.svg",
                    //   height: 15,
                    // ),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: address2Controller,
              onChanged: (value) {
                // authorName = value;
              },
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: "Address 2",
                hintText: "Enter your address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: Icon(Icons.add_location),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Mail.svg",
                  //   height: 15,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
      FAStep(
        title: Text(
          'Password',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        isActive: true,
        state: FAStepstate.indexed,
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  // authorName = value;
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                    child: SvgPicture.asset(
                      "assets/icons/Lock.svg",
                      height: 15,
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: confirmPasswordController,
              onChanged: (value) {
                // authorName = value;
              },
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Enter your password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: SvgPicture.asset(
                    "assets/icons/Lock.svg",
                    height: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return _mystepper;
  }

  viewList() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        alternateEmailController.text.isEmpty ||
        mobileNoController.text.isEmpty ||
        alternateMobileNoController.text.isEmpty ||
        address1Controller.text.isEmpty ||
        address2Controller.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      setState(
        () {
          if (firstNameController.text.isEmpty) {
            demoList.add("First Name field is empty");
          } else if (lastNameController.text.isEmpty) {
            demoList.add("Last Name field is Empty");
          } else if (emailController.text.isEmpty) {
            demoList.add("Email field is empty");
          } else if (alternateEmailController.text.isEmpty) {
            demoList.add("Alternate Email field is empty");
          } else if (mobileNoController.text.isEmpty) {
            demoList.add("Mobile No field is empty");
          } else if (alternateMobileNoController.text.isEmpty) {
            demoList.add("Alternate Mobile No  field is empty");
          } else if (address1Controller.text.isEmpty) {
            demoList.add("Address1 field is empty");
          } else if (address2Controller.text.isEmpty) {
            demoList.add("Address2 field is empty");
          } else if (passwordController.text.isEmpty) {
            demoList.add("Password field is empty");
          } else if (confirmPasswordController.text.isEmpty) {
            demoList.add("Confirm Password field is empty");
          }
        },
      );
    } else {
      demoList.add(firstNameController.text);
      demoList.add(lastNameController.text);
      demoList.add(emailController.text);
      demoList.add(alternateEmailController.text);
      demoList.add(mobileNoController.text);
      demoList.add(alternateMobileNoController.text);
      demoList.add(address1Controller.text);
      demoList.add(address2Controller.text);
      demoList.add(passwordController.text);
      demoList.add(confirmPasswordController.text);

      setState(
        () {
          demoList = demoList;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              FAStepper(
                //titleHeight: 150.0,

                stepNumberColor: Colors.deepOrange,
                //titleIconArrange: FAStepperTitleIconArrange.column,
                physics: ClampingScrollPhysics(),
                steps: _stepper(),
                type: _stepperType,
                currentStep: this._currentStep,
                onStepTapped: (step) {
                  setState(() {
                    this._currentStep = step;
                  });
                  print('onStepTapped :' + step.toString());
                },

                onStepContinue: () {
                  setState(() {
                    if (this._currentStep < this._stepper().length - 1) {
                      this._currentStep = this._currentStep + 1;
                      FAStepstate.complete;
                    } else {
                      _currentStep = 0;
                      //StepState.complete;

                    }
                  });
                  print('onStepContinue :' + _currentStep.toString());
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentStep > 0) {
                      this._currentStep = this._currentStep - 1;
                      onStepContinue();
                    } else {
                      this._currentStep = 0;
                    }
                  });
                  print('onStepCancel :' + _currentStep.toString());
                },
                controlsBuilder: (BuildContext context,
                    {void Function()? onStepCancel,
                    void Function()? onStepContinue}) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () => onStepContinue!(),
                          label: Text('NEXT STEP'),
                          color: Theme.of(context).primaryColorLight,
                        ),
                        FlatButton(
                          child: Text('PREVIOUS STEP'),
                          onPressed: onStepCancel,
                        )
                      ],
                    ),
                  );
                },
              ),
              demoList.isEmpty
                  ? Text("")
                  : Column(
                      children: demoList.map((e) {
                        return Text(e);
                      }).toList(),
                    ),
              ElevatedButton(
                onPressed: () {
                  // showDialog(context: context,
                  //     builder: (BuildContext context){
                  //       return const CustomDialogBox(
                  //
                  //         title: "Profile Details",
                  //         descriptions: "",
                  //         text: "Yes",
                  //       );
                  //     }
                  // );
                  demoList = [];
                  viewList();
                },
                child: Text("Click to see Profile Details"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      height: 50.0,
                      //color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //    // color: Colors.black,
                            //     style: BorderStyle.solid,
                            //     width: 1.0),
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Center(
                            child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _switchStepType,
      //   backgroundColor: Color(0xFFC41A3B),
      //   child: Icon(Icons.swap_horizontal_circle),
      // ),
    );
  }

  void onStepContinue() {
    if (FAStepstate.indexed != null) {
      FAStepstate.complete;
    } else {
      FAStepstate.editing;
    }
  }





}



