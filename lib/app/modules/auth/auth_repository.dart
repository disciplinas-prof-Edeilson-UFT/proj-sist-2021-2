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
      FirebaseAuth.instance.currentUser!;
      if (!user.user!.emailVerified) {
        user.user!.sendEmailVerification();
      }
      final response =
          await userCollection.doc(user.user!.uid).get().then((value) async {
        if (value.data()!['isClient']) {
          final client = await clientsCollection.doc(user.user!.uid).get();
          return [
            value.data()!['isClient'],
            client['delivery_at'],
          ];
        } else {
          return [value.data()!['isClient'], null];
        }
      });
      return {
        'user': user,
        'isClient': response.first,
        'delivery_at': response.last ?? '',
      };
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw e.code;
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
