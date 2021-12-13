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

  Future<Map<String, dynamic>> registerClient(
      Cliente user, String password) async {
    String uid = '';
    String addressUid = '';
    final mapAddress = user.address!.toMap();
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      uid = userCredential.user!.uid;
      await userCollection.doc(uid).set({
        'name': user.name,
        'phone': user.phone,
        'email': user.email,
        'isClient': true,
      });
      await addressCollection.add(mapAddress).then(
        (value) async {
          await clientsCollection.doc(uid).set({
            'cards': [],
            'cpf': user.cpf,
            'address': [value.id],
            'delivery_at': value.id
          });
          addressUid = value.id;
        },
      );

      log(userCredential.user!.uid);
      return {
        'user': userCredential,
        'address': addressUid,
      };
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

  Future<bool> checkData(String email, String phone, String cpf) async {
    try {
      final doubleUsers = await userCollection.get().then((value) async => value
          .docs
          .where((element) =>
              element.exists &&
              (element['email'] == email || element['phone'] == phone))
          .isEmpty);
      final doubleClients = await clientsCollection.get().then((value) =>
          value.docs.where((element) => element['cpf'] == cpf).isEmpty);

      return doubleClients && doubleUsers;
    } catch (e) {
      throw Exception('Não foi possível verificar os dados');
    }
  }
}
