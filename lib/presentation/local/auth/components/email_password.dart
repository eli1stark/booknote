import 'package:booknote/domain/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/auth/auth_cubit.dart';
import 'styles.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, state) {
        // TextEditingController controller;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              TextField(
                // controller: controller,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                decoration: authFieldDecoration(true),
                onChanged: (value) => print('EMAIL: $value'),
                onSubmitted: (value) => print('EMAIL COMPLETE with $value'),
              ),
              SizedBox(height: 30.0),
              TextField(
                style: TextStyle(
                  fontSize: 20.0,
                ),
                obscureText: true,
                decoration: authFieldDecoration(false),
                onChanged: (value) => print('PASSWORD: $value'),
                onSubmitted: (value) => print('PASSWORD COMPLETE with $value'),
              ),
              SizedBox(height: 10.0),
              if (state == AuthState.login)
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      // todo forgotPassword()
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          letterSpacing: 0.5,
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
