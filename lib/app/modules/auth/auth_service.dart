import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<bool> login(String email, String password);

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithFacebook();
}
