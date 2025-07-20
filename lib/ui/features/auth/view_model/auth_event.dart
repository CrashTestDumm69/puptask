part of 'auth_view_model.dart';

abstract class AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;

  AuthSignUp({required this.email, required this.password});
}

class AuthLogIn extends AuthEvent {
  final String email;
  final String password;

  AuthLogIn({required this.email, required this.password});
}
