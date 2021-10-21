import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository(this.auth, {authInstance});

  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('O e-mail não foi encontrado');
      } else if (e.code == 'wrong-password' || e.code == 'invalid-email') {
        throw Exception('E-mail ou senha incorretos');
      }
    }
    throw Exception('Houve um erro desconhecido ao tentar fazer login.');
  }
}
