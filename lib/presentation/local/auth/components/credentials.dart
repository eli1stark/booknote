import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booknote/domain/auth/auth_state.dart';
import 'package:booknote/domain/auth/credentials.dart';
import '../../../../application/auth/auth_state_cubit.dart';
import '../../../../application/auth/credentials_cubit.dart';
import 'styles.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<CredentialsCubit, Credentials>(
            builder: (context, credentialsState) {
          // Create 'CredentialsCubit' instance
          CredentialsCubit credentialsCubit =
              BlocProvider.of<CredentialsCubit>(context);

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                TextFormField(
                  style: authFieldStyle,
                  decoration: authFieldDecoration(true),
                  onChanged: (value) {
                    credentialsCubit.changeEmail(value, credentialsState);
                    // email = value;
                    print('EMAIL: $value');
                  },
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  obscureText: true,
                  style: authFieldStyle,
                  decoration: authFieldDecoration(false),
                  onChanged: (value) {
                    credentialsCubit.changePassword(value, credentialsState);
                    // password = value;
                    print('PASSWORD: $value');
                  },
                ),
                SizedBox(height: 10.0),
                if (authState == AuthState.login)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        // todo forgotPassword()
                        print('forgot password');
                        // print(email);
                        // print(password);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Forgot Password?',
                          style: forgotPasswordStyle,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          );
        });
      },
    );
  }
}
