import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/base_project/common/constants.dart';
import 'dart:core';

import 'package:onboarding_screen/screens/components/default_button.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: height * 0.036),
          buildPasswordFormField(),
          SizedBox(height: height * 0.036),
          buildConfirmPasswordFormField(),
          SizedBox(height: height * 0.036),
          DefaultButton(text: "Continue", press: () {}),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: kEmailNullError);
        //   return "";
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        // return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            width * 0.036,
            width * 0.036,
            width * 0.036,
          ),
          child: SvgPicture.asset(
            "assets/icons/Mail.svg",
            height: width * 0.050,
          ),
        ),
        //CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: kEmailNullError);
        //   return "";
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        // return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            width * 0.036,
            width * 0.036,
            width * 0.036,
          ),
          child: SvgPicture.asset(
            "assets/icons/Lock.svg",
            height: width * 0.050,
          ),
        ),
        //CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        // if (value.isEmpty) {
        //   addError(error: kEmailNullError);
        //   return "";
        // } else if (!emailValidatorRegExp.hasMatch(value)) {
        //   addError(error: kInvalidEmailError);
        //   return "";
        // }
        // return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            width * 0.036,
            width * 0.036,
            width * 0.036,
          ),
          child: SvgPicture.asset(
            "assets/icons/Lock.svg",
            height: width * 0.050,
          ),
        ),
        //CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
