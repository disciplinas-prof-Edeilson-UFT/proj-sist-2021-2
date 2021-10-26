import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/modules/auth/auth_service.dart';

class AuthRepository extends AuthService {
  final FirebaseAuth auth;

  AuthRepository(this.auth, {authInstance});

  @override
  Future<bool> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = FirebaseAuth.instance.currentUser!;
      if (user.emailVerified == false) {
        user.sendEmailVerification();
      }
      return user.emailVerified;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('O e-mail não foi encontrado');
      } else if (e.code == 'wrong-password' || e.code == 'invalid-email') {
        throw Exception('E-mail ou senha incorretos');
      }
    }
    throw Exception('Houve um erro desconhecido ao tentar fazer login.');
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({'display': 'popup'});
    try {
      return await FirebaseAuth.instance.signInWithPopup(facebookProvider);
    } on Exception catch (_) {
      throw Exception("Houve um erro ao tentar entrar no Facebook");
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('email');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    try {
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } on Exception catch (_) {
      throw Exception('Houve um erro ao fazer login com Google');
    }
  }
}
