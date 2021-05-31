import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/screens/profile/components/my_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'package:onboarding_screen/helper/keyboard.dart';
import 'dart:core';

import 'package:onboarding_screen/screens/components/default_button.dart';
import 'package:onboarding_screen/screens/login_success/login_success.dart';
//import 'package:onboarding_screen/size_config.dart';

class FAStepperExample extends StatefulWidget {
  @override
  _FAStepperExampleState createState() => _FAStepperExampleState();
}

class _FAStepperExampleState extends State<FAStepperExample> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  late double height, width;
  final List<String> errors = [];


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

  String title = 'Stepper (Custom)';

  int _currentStep = 0;

  FAStepperType _stepperType = FAStepperType.vertical;

  _switchStepType() {
    setState(() => _stepperType == FAStepperType.vertical
        ? _stepperType = FAStepperType.horizontal
        : _stepperType = FAStepperType.vertical);
  }

  final List<FAStep> _stepper = [
    FAStep(
      title: Text('Profole Pic'),
      isActive:  true,
      //isActive: true,
      state: FAStepstate.indexed,
      //state: FAStepstate.complete,
      content: Column(
        children: <Widget>[
          MyAccount(),

          // TextFormField(
          //   decoration: InputDecoration(labelText: 'Last Name'),
          // ),
        ],
      ),
    ),
    FAStep(
      title: Text('Name'),


      isActive: true,
      state: FAStepstate.indexed,
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "First Name",
                hintText: "Enter your first name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Mail.svg",
                  //   height: 15,
                  // ),
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
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
      title: Text('Email'),
      isActive: true,
      state: FAStepstate.indexed,
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
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
      title: Text('Mobile No.'),
      isActive: true,
      state: FAStepstate.indexed,
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Mobile No.",
                hintText: "Enter your mobile no.",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Mail.svg",
                  //   height: 15,
                  // ),
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Alternate Mobile No.",
              hintText: "Enter your mobile no",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
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
      title: Text('Address'),
      isActive: true,
      state: FAStepstate.indexed,
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: "Address 1",
                hintText: "Enter your address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  // child: SvgPicture.asset(
                  //   "assets/icons/Mail.svg",
                  //   height: 15,
                  // ),
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              labelText: "Address 2",
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
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
      title: Text('Password'),
      isActive: true,
      state: FAStepstate.indexed,
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
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

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        child: FAStepper(
           //titleHeight: 150.0,

          stepNumberColor: Colors.deepOrange,
          //titleIconArrange: FAStepperTitleIconArrange.column,
          physics: ClampingScrollPhysics(),
          steps: _stepper,
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
              if (this._currentStep < this._stepper.length - 1  ) {
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _switchStepType,
        backgroundColor: Color(0xFFC41A3B),
        child: Icon(Icons.swap_horizontal_circle),
      ),
    );
  }

  void onStepContinue () {
    if (FAStepstate.indexed != null) {
      FAStepstate.complete;

    } else {
      FAStepstate.editing;
    }

  }

}
