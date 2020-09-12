import 'package:booknote/domain/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AuthState.register);

  void nextState(AuthState state) {
    if (state == AuthState.register) {
      emit(AuthState.login);
    } else {
      emit(AuthState.register);
    }
  }
}
