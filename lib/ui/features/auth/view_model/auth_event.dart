part of 'auth_view_model.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpEvent({
    required this.email,
    required this.password
  });
}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent({
    required this.email,
    required this.password
  });
}