import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';
import 'package:pscomidas/app/global/repositories/register/register_repository_interface.dart';

class RegisterRepository extends IRegisterRepository {
  final RestaurantRegisterStore registerStore =
      Modular.get<RestaurantRegisterStore>();

  final CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void>? addRestaurant() {
    restaurant.add({
      'name_Owner': registerStore.controller['nome']?.text,
      'email_Owner': registerStore.controller['email']?.text,
      'phone_Owner': registerStore.controller['telefone']?.text,
      'CNPJ': registerStore.controller['CNPJ']?.text,
      'company_name': registerStore.controller['Razão Social']?.text,
      'social_name': registerStore.controller['Nome da loja']?.text,
      'phone_restaurant': registerStore.controller['Telefone da loja']?.text,
      'CEP': registerStore.controller['CEP']?.text,
      'state': registerStore.controller['Estado']?.text,
      'city': registerStore.controller['Cidade']?.text,
      'district': registerStore.controller['Bairro']?.text,
      'address': registerStore.controller['Endereço']?.text,
      'number': registerStore.controller['Número']?.text,
      'complement': registerStore.controller['Complemento (Opcional)']?.text,
      'password': registerStore.controller['Senha']?.text,
      'delivery_plan': registerStore.controller['Plano de Entrega']?.text,
      'category': registerStore.controller['Categoria']?.text,
    });
  }

  @override
  Future<UserCredential> signUp() async {
    var uid = '';
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: registerStore.controller['email']!.text,
        password: registerStore.controller['Senha']!.text,
      );
      uid = userCredential.user!.uid;
      log(userCredential.user!.uid);
      return userCredential;
    } catch (e) {
      throw Exception('Houve um erro ao registrar');
    }
  }
}
