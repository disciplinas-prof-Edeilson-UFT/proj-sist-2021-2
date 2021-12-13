import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/repositories/register_restaurant/register_repository_service.dart';

class RegisterRepository extends RegisterRepositoryService {
  final CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void>? addRestaurant(
      String restaurantUID, Map<String, TextEditingController> controller) {
    restaurant.doc(restaurantUID).set({
      'nameOwner': controller['Nome']?.text,
      'emailOwner': controller['Email']?.text,
      'phoneOwner': controller['Telefone']?.text,
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
      'cupom': {'tipo': 'nenhum'},
    });
  }

  @override
  Future<void>? addUser(
      String userUID, Map<String, TextEditingController> controller) {
    users.doc(userUID).set({
      'name': controller['Nome']?.text,
      'email': controller['Email']?.text,
      'phone': controller['Telefone']?.text,
      'isClient': false,
    });
  }

  @override
  Future<UserCredential> signUp(
      Map<String, TextEditingController> controller) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: controller['Email']!.text,
        password: controller['Senha']!.text,
      );
      userCredential.user!.uid;
      log(userCredential.user!.uid);
      return userCredential;
    } catch (e) {
      throw Exception('Houve um erro ao registrar');
    }
  }

  @override
  Future<bool>? isUniqueEmail(String email) async {
    return (await users.where('Email', isEqualTo: email).get()).size == 0;
  }

  @override
  Future<bool>? isUniqueCNPJ(String cnpj) async {
    return (await restaurant.where('CNPJ', isEqualTo: cnpj).get()).size == 0;
  }
}
