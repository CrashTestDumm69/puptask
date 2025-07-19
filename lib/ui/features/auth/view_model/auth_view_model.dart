import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/data/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthViewModel extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;

  AuthViewModel({required AuthRepository authRepo})
      : _authRepo = authRepo, super(AuthInitial()) {
    on<SignUpEvent>(_onSignUpRequested);
    on<LogInEvent>(_onLogInRequested);
  }

  Future<void> _onSignUpRequested(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepo.signUp(
        email: event.email, 
        password: event.password,
      );
      if (user != null) emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogInRequested(LogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepo.logIn(
        email: event.email, 
        password: event.password,
      );
      if (user != null) emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
