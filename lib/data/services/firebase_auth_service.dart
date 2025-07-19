import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final firebase = FirebaseAuth.instance;

  Future<User?> signUp({required String email, required String password}) async {
    try {
      final user = await firebase.createUserWithEmailAndPassword(email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw("Weak password");
      } else if (e.code == "email-already-in-use") {
        throw("Account already exists with this email");
      }
    }

    return null;
  }

  Future<User?> logIn({required String email, required String password}) async {
    try {
      final user = await firebase.signInWithEmailAndPassword(email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw('Wrong password provided for that user');
      }
    }

    return null;
  }
}