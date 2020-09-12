import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:booknote/domain/auth/auth_state.dart';
import 'package:booknote/domain/auth/credentials.dart';
import 'package:booknote/domain/auth/user.dart';
import 'package:booknote/infrastructure/auth/auth.dart';
import '../../../../application/auth/auth_state_cubit.dart';
import '../../../../application/auth/credentials_cubit.dart';
import 'styles.dart';

class LogInSignUpButtons extends StatelessWidget {
  const LogInSignUpButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // AUTH ANON
    final AuthService _auth = AuthService();

    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<CredentialsCubit, Credentials>(
          builder: (context, credentialsState) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.102,
              ),
              child: Column(
                children: [
                  Material(
                    borderRadius: borderRadiusCiricular30,
                    color: Colors.grey[900],
                    child: InkWell(
                      splashColor: Colors.white38,
                      highlightColor: Colors.transparent,
                      borderRadius: borderRadiusCiricular30,
                      onTap: () async {
                        // anon test
                        AppUser result = await _auth.signInAnon();
                        if (result != null) {
                          print('Signed In');
                          print(result.uid);
                        } else {
                          print('Error Signed In');
                        }
                      },
                      child: Container(
                        height: size.height * 0.073,
                        decoration: logInSignUpButtonDecoration,
                        child: Center(
                          child: Text(
                            authState == AuthState.login ? 'LOGIN' : 'SIGN UP',
                            style: logInSignUpButtonStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.026,
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    borderRadius: borderRadiusCiricular30,
                    onTap: () {
                      // todo Google Sign In
                      print('Buttons: ${credentialsState.email}');
                      print('Buttons: ${credentialsState.password}');
                    },
                    child: Container(
                      height: size.height * 0.073,
                      decoration: googleButtonDecoration,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.google,
                              size: 25.0,
                            ),
                            SizedBox(
                              width: size.width * 0.0255,
                            ),
                            Text(
                              'Continue with Google',
                              style: googleButtonStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
