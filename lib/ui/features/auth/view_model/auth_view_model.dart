import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/data/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthViewModel extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;

  AuthViewModel({required AuthRepository authRepo})
    : _authRepo = authRepo,
      super(AuthInitial()) {
    on<AuthSignUp>(_onSignUpRequested);
    on<AuthLogIn>(_onLogInRequested);
  }

  Future<void> _onSignUpRequested(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepo.signUp(email: event.email, password: event.password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }

    final user = _authRepo.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      emit(AuthError("Logging in failed"));
    }
  }

  Future<void> _onLogInRequested(
    AuthLogIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepo.logIn(email: event.email, password: event.password);
    } catch (e) {
      emit(AuthError(e.toString()));
    }

    final user = _authRepo.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      emit(AuthError("Logging in failed"));
    }
  }
}
