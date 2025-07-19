import 'package:firebase_auth/firebase_auth.dart';

import 'package:puptask/data/services/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _authService;

  AuthRepository({
    required FirebaseAuthService authService
  }) : _authService = authService;

  Future<User?> signUp({required String email, required String password}) async {
    try {
      return await _authService.signUp(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> logIn({required String email, required String password}) async {
    try {
      return await _authService.logIn(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}