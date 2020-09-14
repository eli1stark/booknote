import 'package:booknote/domain/auth/credentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CredentialsCubit extends Cubit<Credentials> {
  CredentialsCubit()
      : super(
          Credentials(
            email: '',
            password: '',
            formKey: GlobalKey<FormState>(),
          ),
        );

  void updateEmail(String value, Credentials state) {
    emit(
      Credentials(
        email: value,
        password: state.password,
        formKey: state.formKey,
      ),
    );
  }

  void updatePassword(String value, Credentials state) {
    emit(
      Credentials(
        email: state.email,
        password: value,
        formKey: state.formKey,
      ),
    );
  }
}
