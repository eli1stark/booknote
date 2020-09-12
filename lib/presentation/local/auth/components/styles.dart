import 'package:flutter/material.dart';

/// EMAIL and PASSWORD Field Style
TextStyle authFieldStyle = TextStyle(
  fontSize: 20.0,
);

/// EMAIL and PASSWORD Field Decoration
InputDecoration authFieldDecoration(bool firstField) {
  return InputDecoration(
    alignLabelWithHint: true,
    labelText: firstField == true ? 'EMAIL' : 'PASSWORD',
    labelStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
    contentPadding: EdgeInsets.all(0),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2.0,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
  );
}

/// Forgot Password Style
TextStyle forgotPasswordStyle = TextStyle(
  decoration: TextDecoration.underline,
  letterSpacing: 0.5,
  fontSize: 15.0,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
);

/// Google Button Style
TextStyle googleButtonStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  letterSpacing: 1.0,
  fontWeight: FontWeight.bold,
);

/// Google Button Decoration
BoxDecoration googleButtonDecoration = BoxDecoration(
  borderRadius: borderRadiusCiricular30,
  border: Border.all(
    color: Colors.black,
    width: 2.0,
  ),
);

/// LogIn/SignUp Button Style
TextStyle logInSignUpButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  letterSpacing: 1.0,
  fontWeight: FontWeight.bold,
);

/// LogIn/SignUp Button Decoration
BoxDecoration logInSignUpButtonDecoration = BoxDecoration(
  borderRadius: borderRadiusCiricular30,
);

/// BorderRadius.circular(30.0)
BorderRadius borderRadiusCiricular30 = BorderRadius.circular(30.0);
