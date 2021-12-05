import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/repositories/register/register_repository_interface.dart';

class RegisterRepository extends IRegisterRepository {
  final CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void>? addRestaurant(
      String restaurantUID, Map<String, TextEditingController> controller) {
    restaurant.doc(restaurantUID).set({
      'nameOwner': controller['nome']?.text,
      'emailOwner': controller['email']?.text,
      'phoneOwner': controller['telefone']?.text,
      'CNPJ': controller['CNPJ']?.text,
      'companyName': controller['Razão Social']?.text,
      'socialName': controller['Nome da loja']?.text,
      'phoneRestaurant': controller['Telefone da loja']?.text,
      'CEP': controller['CEP']?.text,
      'state': controller['Estado']?.text,
      'city': controller['Cidade']?.text,
      'district': controller['Bairro']?.text,
      'address': controller['Endereço']?.text,
      'number': controller['Número']?.text,
      'complement': controller['Complemento (Opcional)']?.text,
      'password': controller['Senha']?.text,
      'deliveryPlan': controller['Plano de Entrega']?.text,
      'category': controller['Categoria']?.text,
    });
  }

  @override
  Future<void>? addUser(
      String userUID, Map<String, TextEditingController> controller) {
    users.doc(userUID).set({
      'name': controller['nome']?.text,
      'email': controller['email']?.text,
      'phone': controller['telefone']?.text,
      'isClient': false,
    });
  }

  @override
  Future<UserCredential> signUp(
      Map<String, TextEditingController> controller) async {
    var uid = '';
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: controller['email']!.text,
        password: controller['Senha']!.text,
      );
      uid = userCredential.user!.uid;
      log(userCredential.user!.uid);
      return userCredential;
    } catch (e) {
      throw Exception('Houve um erro ao registrar');
    }
  }

  @override
  Future<bool>? isUniqueEmail(String email) async {
    return (await users.where('email', isEqualTo: email).get()).size == 0;
  }

  @override
  Future<bool>? isUniqueCNPJ(String cnpj) async {
    return (await restaurant.where('CNPJ', isEqualTo: cnpj).get()).size == 0;
  }
}
