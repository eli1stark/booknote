import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booknote/domain/auth/auth_state.dart';
import 'package:booknote/domain/auth/credentials.dart';
import '../../../../application/auth/auth_state_cubit.dart';
import '../../../../application/auth/credentials_cubit.dart';
import 'forgot_password/forgot_password.dart';
import 'helpers.dart';
import 'styles.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // check size of the user's phone
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<AuthStateCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<CredentialsCubit, Credentials>(
          builder: (context, credentialsState) {
            // Create 'CredentialsCubit' instance
            CredentialsCubit credentialsCubit =
                BlocProvider.of<CredentialsCubit>(context);

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.0765,
              ),
              child: Form(
                key: credentialsState.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: authFieldStyle,
                      textInputAction: TextInputAction.next,
                      decoration: authFieldDecoration(true),
                      validator: (value) =>
                          emailValidator(value) ? null : emailHint,
                      onChanged: (value) =>
                          credentialsCubit.updateEmail(value, credentialsState),
                      onFieldSubmitted: (value) =>
                          FocusScope.of(context).nextFocus(),
                    ),
                    SizedBox(
                      height: size.height * 0.039,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: authFieldStyle,
                      textInputAction: TextInputAction.done,
                      decoration: authFieldDecoration(false),
                      validator: (value) =>
                          passwordValidator(value) ? passwordHint : null,
                      onChanged: (value) => credentialsCubit.updatePassword(
                          value, credentialsState),
                    ),
                    SizedBox(
                      height: size.height * 0.013,
                    ),
                    if (authState == AuthState.login)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ForgotPassword(),
                      )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
