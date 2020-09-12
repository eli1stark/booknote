import 'package:booknote/domain/auth/credentials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CredentialsCubit extends Cubit<Credentials> {
  CredentialsCubit() : super(Credentials(email: '', password: ''));

  void changeEmail(String value, Credentials state) {
    emit(
      Credentials(
        email: value,
        password: state.password,
      ),
    );
  }

  void changePassword(String value, Credentials state) {
    emit(
      Credentials(
        email: state.email,
        password: value,
      ),
    );
  }
}
