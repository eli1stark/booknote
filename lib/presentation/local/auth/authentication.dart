import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/bottom_text.dart';
import 'components/buttons/buttons.dart';
import 'components/credentials.dart';
import 'components/header.dart';
import '../../../application/auth/auth_state_cubit.dart';
import '../../../application/auth/credentials_cubit.dart';

class Authentication extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    // disable Android back button on Auth Page to prevent crash
    // related to the Auth Stream (problems with the package)
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthStateCubit>(
            create: (BuildContext context) => AuthStateCubit(),
          ),
          BlocProvider<CredentialsCubit>(
            create: (BuildContext context) => CredentialsCubit(),
          ),
        ],
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
                  child: LogInSignUpButtons(),
                ),
                Expanded(
                  flex: 1,
                  child: BottomText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
