import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/bottom_text.dart';
import 'components/buttons.dart';
import 'components/email_password.dart';
import 'components/header.dart';
import '../../../application/auth/auth_cubit.dart';

class Authentication extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthStateCubit>(
      create: (BuildContext context) => AuthStateCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Header(),
              ),
              Expanded(
                flex: 3,
                child: EmailPassword(),
              ),
              Expanded(
                flex: 2,
                child: LoginSignUpButtons(),
              ),
              Expanded(
                flex: 1,
                child: BottomText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
