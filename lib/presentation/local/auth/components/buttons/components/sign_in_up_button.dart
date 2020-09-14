import 'package:booknote/domain/auth/auth_state.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';

class SignInSignUpButton extends StatelessWidget {
  const SignInSignUpButton(this.authState);

  final AuthState authState;

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.073,
      decoration: logInSignUpButtonDecoration,
      child: Center(
        child: Text(
          authState == AuthState.login ? 'LOGIN' : 'SIGN UP',
          style: logInSignUpButtonStyle,
        ),
      ),
    );
  }
}
