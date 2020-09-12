import 'package:booknote/domain/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/auth/auth_cubit.dart';
import 'styles.dart';

class LoginSignUpButtons extends StatelessWidget {
  const LoginSignUpButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, state) {
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
                  onTap: () => print('dummy tap'),
                  child: Container(
                    height: size.height * 0.073,
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusCiricular30,
                    ),
                    child: Center(
                      child: Text(
                        state == AuthState.login ? 'LOGIN' : 'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
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
                onTap: () => print('dummy tap'),
                child: Container(
                  height: size.height * 0.073,
                  decoration: BoxDecoration(
                    borderRadius: borderRadiusCiricular30,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
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
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
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
  }
}
