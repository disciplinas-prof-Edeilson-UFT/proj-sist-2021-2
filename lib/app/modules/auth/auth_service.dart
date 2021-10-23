import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<dynamic> login(String email, String password);

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithFacebook();
}
