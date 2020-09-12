import 'package:booknote/domain/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/auth/auth_cubit.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, state) {
        // Create 'AuthStateCubit' instance
        final AuthStateCubit authStateCubit =
            BlocProvider.of<AuthStateCubit>(context);

        return Container(
          child: Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                children: [
                  TextSpan(
                    text: state == AuthState.login
                        ? 'New to Booknote? '
                        : 'Already have an account? ',
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => authStateCubit.nextState(state),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          state == AuthState.login ? 'Register' : 'Login',
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
