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
}
