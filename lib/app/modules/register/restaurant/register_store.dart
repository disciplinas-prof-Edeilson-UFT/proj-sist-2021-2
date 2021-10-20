import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

enum SingingCharacter { plan1, plan2 }

abstract class _RegisterStore with Store {
  CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');

  Map<String, TextEditingController> controller = {
    'name': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'CNPJ': TextEditingController(),
    'Razão Social': TextEditingController(),
    'Nome da loja': TextEditingController(),
    'Telefone da loja': TextEditingController(),
    'CEP': TextEditingController(),
    'Cidade': TextEditingController(),
    'Bairro': TextEditingController(),
    'Endereço': TextEditingController(),
    'Número': TextEditingController(),
    'Complemento (Opcional)': TextEditingController(),
    'Senha': TextEditingController(),
    'Plano de Entrega': TextEditingController(),
    'Categoria': TextEditingController(),
  };

  @action
  Future<void>? addRestaurant(Map<String, TextEditingController> controller) {
    restaurant.add({
      'nomeOwner': controller['name']?.text,
      'email_Owner': controller['email']?.text,
      'telefone_Owner': controller['phone']?.text,
      'CNPJ': controller['CNPJ']?.text,
      'razao_social': controller['Razão Social']?.text,
      'nome_loja': controller['Nome da loja']?.text,
      'telefone_loja': controller['Telefone da loja']?.text,
      'CEP': controller['CEP']?.text,
      'cidade': controller['Cidade']?.text,
      'bairro': controller['Bairro']?.text,
      'endereço': controller['Endereço']?.text,
      'numero': controller['Número']?.text,
      'complemento': controller['Complemento (Opcional)']?.text,
      'senha': controller['Senha']?.text,
      'plano_entrega': controller['Plano de Entrega']?.text,
      'categoria': controller['Categoria']?.text,
    });
  }

  @observable
  var selectedValue = 'Açaí';

  @action
  setSelectedValue(newValue, controller) {
    selectedValue = newValue;
    controller!['Categoria']!.text = newValue;
    return controller;
  }

  @observable
  SingingCharacter? character = SingingCharacter.plan1;

  @action
  setPlan(newValue, text, controller) {
    character = newValue;
    controller!['Plano de Entrega']!.text = text;
    return controller;
  }
}
