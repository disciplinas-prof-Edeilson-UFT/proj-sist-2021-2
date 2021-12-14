import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/repositories/client_address/client_address_repository.dart';
import 'package:pscomidas/app/modules/auth/auth_service.dart';

class AuthRepository extends AuthService {
  final FirebaseAuth auth;

  AuthRepository(this.auth, {authInstance});
  final userCollection = FirebaseFirestore.instance.collection('users');
  final clientsCollection = FirebaseFirestore.instance.collection('clients');

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await getUserInfo(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('Usuário não encontrado');
      } else if (e.code == 'wrong-password' || e.code == 'invalid-email') {
        throw Exception('E-mail ou senha incorretos');
      }
      throw Exception('Houve um erro desconhecido ao tentar fazer login.');
    }
  }

  @override
  Future<DeliveryAt> fetchDeliveryAt(String uid) async {
    try {
      final response = await addressCollection
          .doc(uid)
          .get()
          .then((value) => DeliveryAt.fromMap(map: value.data()!, uid: uid));
      return response;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Map<String, dynamic>> signInWithFacebook() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({'display': 'popup'});
    try {
      final response =
          await FirebaseAuth.instance.signInWithPopup(facebookProvider);
      return await getUserInfo(response);
    } on Exception catch (_) {
      throw Exception("Houve um erro ao tentar entrar no Facebook");
    }
  }

  @override
  Future<Map<String, dynamic>> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('email');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    try {
      final response =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      return await getUserInfo(response);
    } on Exception catch (_) {
      throw Exception('Houve um erro ao fazer login com Google');
    }
  }

  @override
  Future<Map<String, dynamic>> getUserInfo(UserCredential user) async {
    if (!user.user!.emailVerified) {
      user.user!.sendEmailVerification();
    }
    final response =
        await userCollection.doc(user.user!.uid).get().then((users) async {
      final data = users.data();
      if (data != null && data['isClient']) {
        final client =
            await clientsCollection.doc(user.user!.uid).get().then((clients) {
          return clients.data();
        });
        return [
          data['isClient'],
          client!['delivery_at'],
        ];
      }
      return [false, null];
    });
    return {
      'user': user,
      'isClient': response.first,
      'delivery_at': response.last ?? '',
    };
  }
}
