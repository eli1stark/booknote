import 'package:flutter/material.dart';
import '../styles.dart';
import 'dialog.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => showDialog(
        context: context,
        builder: (_) => forgotPasswordDialog(context),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.0065,
        ),
        child: Text(
          'Forgot Password?',
          style: forgotPasswordStyle,
        ),
      ),
    );
  }
}
