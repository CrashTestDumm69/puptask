import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final _firebase = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebase.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw("Weak password");
      } else if (e.code == "email-already-in-use") {
        throw("Account already exists with this email");
      }
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    try {
      await _firebase.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw('Wrong password provided for that user');
      }
    }
  }

  User? getCurrentUser() {
    return _firebase.currentUser;
  }
}