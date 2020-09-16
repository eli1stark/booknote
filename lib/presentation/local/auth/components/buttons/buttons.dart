import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booknote/domain/auth/auth_state.dart';
import 'package:booknote/domain/auth/credentials.dart';
import 'package:booknote/infrastructure/auth/auth.dart';
import '../../../../../application/auth/auth_state_cubit.dart';
import '../../../../../application/auth/credentials_cubit.dart';
import '../styles.dart';
import 'components/google_button.dart';
import 'components/sign_in_up_button.dart';

class LogInSignUpButtons extends StatelessWidget {
  const LogInSignUpButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    // create an instance of Authentication Service
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
                        if (credentialsState.formKey.currentState.validate()) {
                          if (authState == AuthState.login) {
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                              credentialsState.email,
                              credentialsState.password,
                            );

                            // in case of error
                            if (result is String) {
                              Scaffold.of(context).showSnackBar(
                                snackBarOnFailure(result),
                              );
                            }
                          } else {
                            dynamic result =
                                await _auth.signUpWithEmailAndPassword(
                              credentialsState.email,
                              credentialsState.password,
                            );

                            // in case of error
                            if (result is String) {
                              Scaffold.of(context).showSnackBar(
                                snackBarOnFailure(result),
                              );
                            }
                          }
                        }
                      },
                      child: SignInSignUpButton(authState),
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
                    },
                    child: GoogleButton(),
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
