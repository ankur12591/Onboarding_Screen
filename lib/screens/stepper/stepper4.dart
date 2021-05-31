import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/screens/profile/components/my_account.dart';

class StepperExample extends StatefulWidget {
  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  //
  // List<Step> steps = [
  //   Step(
  //     title: new Text('Profole Pic'),
  //     content: Column(
  //       children: <Widget>[
  //         MyAccount(),
  //       ],
  //     ),
  //     isActive: _currentStep >= 0,
  //     state: _currentStep >= 0 ?
  //     StepState.complete : StepState.disabled,
  //   ),
  //   Step(
  //     title: new Text('Name'),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 20.0),
  //           child: TextFormField(
  //             keyboardType: TextInputType.emailAddress,
  //             decoration: InputDecoration(
  //               labelText: "First Name",
  //               hintText: "Enter your first name",
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               suffixIcon: Padding(
  //                 padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //                 // child: SvgPicture.asset(
  //                 //   "assets/icons/Mail.svg",
  //                 //   height: 15,
  //                 // ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         TextFormField(
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: InputDecoration(
  //             labelText: "Last Name",
  //             hintText: "Enter your last name",
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             suffixIcon: Padding(
  //               padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //               // child: SvgPicture.asset(
  //               //   "assets/icons/Mail.svg",
  //               //   height: 15,
  //               // ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     isActive: _currentStep >= 0,
  //     state: _currentStep >= 0 ?
  //     StepState.complete : StepState.disabled,
  //   ),
  //   Step(
  //     title: new Text('Account'),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 20.0),
  //           child: TextFormField(
  //             keyboardType: TextInputType.emailAddress,
  //             decoration: InputDecoration(
  //               labelText: "Email",
  //               hintText: "Enter your email",
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               suffixIcon: Padding(
  //                 padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //                 child: SvgPicture.asset(
  //                   "assets/icons/Mail.svg",
  //                   height: 15,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         TextFormField(
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: InputDecoration(
  //             labelText: "Recovery Email",
  //             hintText: "Enter your email",
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             suffixIcon: Padding(
  //               padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //               child: SvgPicture.asset(
  //                 "assets/icons/Mail.svg",
  //                 height: 15,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     isActive: _currentStep >= 0,
  //     state: _currentStep >= 0 ?
  //     StepState.complete : StepState.disabled,
  //   ),
  //   Step(
  //     title: new Text('Mobile No.'),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 20.0),
  //           child: TextFormField(
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: "Mobile No.",
  //               hintText: "Enter your mobile no.",
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               suffixIcon: Padding(
  //                 padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //                 // child: SvgPicture.asset(
  //                 //   "assets/icons/Mail.svg",
  //                 //   height: 15,
  //                 // ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         TextFormField(
  //           keyboardType: TextInputType.number,
  //           decoration: InputDecoration(
  //             labelText: "Alternate Mobile No.",
  //             hintText: "Enter your mobile no",
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             suffixIcon: Padding(
  //               padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //               // child: SvgPicture.asset(
  //               //   "assets/icons/Mail.svg",
  //               //   height: 15,
  //               // ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     isActive: _currentStep >= 0,
  //     state: _currentStep >= 1 ?
  //     StepState.complete : StepState.disabled,
  //   ),
  //   Step(
  //     title: new Text('Address'),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 20.0),
  //           child: TextFormField(
  //             keyboardType: TextInputType.streetAddress,
  //             decoration: InputDecoration(
  //               labelText: "Address 1",
  //               hintText: "Enter your address",
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               suffixIcon: Padding(
  //                 padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //                 // child: SvgPicture.asset(
  //                 //   "assets/icons/Mail.svg",
  //                 //   height: 15,
  //                 // ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         TextFormField(
  //           keyboardType: TextInputType.streetAddress,
  //           decoration: InputDecoration(
  //             labelText: "Address 2",
  //             hintText: "Enter your address",
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             suffixIcon: Padding(
  //               padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //               // child: SvgPicture.asset(
  //               //   "assets/icons/Mail.svg",
  //               //   height: 15,
  //               // ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     isActive:_currentStep >= 0,
  //     state: _currentStep >= 2 ?
  //     StepState.complete : StepState.disabled,
  //   ),
  //   Step(
  //     title: new Text('Password'),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 20.0),
  //           child: TextFormField(
  //             keyboardType: TextInputType.visiblePassword,
  //             decoration: InputDecoration(
  //               labelText: "Password",
  //               hintText: "Enter your password",
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               suffixIcon: Padding(
  //                 padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //                 child: SvgPicture.asset(
  //                   "assets/icons/Lock.svg",
  //                   height: 15,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         TextFormField(
  //           keyboardType: TextInputType.visiblePassword,
  //           decoration: InputDecoration(
  //             labelText: "Confirm Password",
  //             hintText: "Enter your password",
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             suffixIcon: Padding(
  //               padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
  //               child: SvgPicture.asset(
  //                 "assets/icons/Lock.svg",
  //                 height: 15,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     isActive: _currentStep >= 0,
  //     state: _currentStep >= 0 ?
  //     StepState.complete : StepState.disabled,
  //   ),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stepper(
                  type: stepperType,
                  physics: ClampingScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
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
                  steps: <Step>[
                    Step(
                      title: new Text('Profole Pic'),
                      content: Column(
                        children: <Widget>[
                          MyAccount(),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Name'),
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "First Name",
                                hintText: "Enter your first name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Account'),
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Enter your email",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                                child: SvgPicture.asset(
                                  "assets/icons/Mail.svg",
                                  height: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 3
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Mobile No.'),
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Mobile No.",
                                hintText: "Enter your mobile no.",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 4
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Address'),
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                labelText: "Address 1",
                                hintText: "Enter your address",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 5
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Password'),
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Enter your password",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 6
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    // setState(() {
    //   if (this._currentStep < this.steps.length - 1  ) {
    //     this._currentStep = this._currentStep + 1;
    //
    //   } else {
    //     _currentStep = 0;
    //     //StepState.complete;
    //
    //   }
    // });
    print('onStepContinue :' + _currentStep.toString());
    if (_currentStep >= 5) return;
    setState(() {
      _currentStep += 1;
    });

    // _currentStep < 1 ?
    // setState(() => _currentStep += 1): null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
