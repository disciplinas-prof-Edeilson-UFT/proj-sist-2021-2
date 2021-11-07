import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pscomidas/app/global/models/entities/cliente.dart';

class RegisterClientRepository {
  final FirebaseAuth auth;
  RegisterClientRepository(this.auth);
  final userCollection = FirebaseFirestore.instance.collection('users');
  final clientsCollection = FirebaseFirestore.instance.collection('clients');
  final addressCollection = FirebaseFirestore.instance.collection('address');

  Future<UserCredential> registerClient(Cliente user, String password) async {
    String uid = '';
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await userCollection.add({
        'name': user.name,
        'email': user.email,
      }).then((value) async {
        uid = value.id;
        await clientsCollection.doc(value.id).set({
          'cards': null,
          'cpf': user.cpf,
          'phone': user.phone,
        }).then(
          (value) async => await addressCollection.doc(uid).set({
            'address_list': [],
          }),
        );
      });
      log(userCredential.user!.uid);
      return userCredential;
    } catch (e) {
      throw Exception('Houve um erro ao registrar');
    }
  }

  Future verifyNumberForWeb(String phoneNumber) async {
    return await auth.signInWithPhoneNumber(
      phoneNumber,
    );
  }

  Future<bool> verifyCodeForWeb(
      ConfirmationResult? confirmationResult, String code) async {
    try {
      final UserCredential? userCredential =
          await confirmationResult?.confirm(code);
      return userCredential?.user != null ? true : false;
    } catch (e) {
      throw Exception('Código inválido');
    }
  }

  Future<bool> verifyEmail(String email) async {
    try {
      return await userCollection
          .where('email', isEqualTo: email)
          .get()
          .then((value) => true)
          .catchError((value) => false);
    } catch (e) {
      throw Exception('Não foi possível verificar o e-mail');
    }
  }
}
