import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'pages/page_two/register_field.dart';
part 'restaurant_register_store.g.dart';

class RestaurantRegisterStore = _RestaurantRegisterStore
    with _$RestaurantRegisterStore;

abstract class _RestaurantRegisterStore with Store {
  CollectionReference restaurant =
      FirebaseFirestore.instance.collection('restaurant');

  var availablePlans = ['Plano Básico', 'Plano Entrega'];

  final String userCity = "Palmas";

  Map<String, TextEditingController> controller = {
    'nome': TextEditingController(),
    'email': TextEditingController(),
    'telefone': TextEditingController(),
    'CNPJ': TextEditingController(),
    'Razão Social': TextEditingController(),
    'Nome da loja': TextEditingController(),
    'Telefone da loja': TextEditingController(),
    'CEP': TextEditingController(),
    'Estado': TextEditingController(),
    'Cidade': TextEditingController(),
    'Bairro': TextEditingController(),
    'Endereço': TextEditingController(),
    'Número': TextEditingController(),
    'Complemento (Opcional)': TextEditingController(),
    'Senha': TextEditingController(),
    'Confirmar Senha': TextEditingController(),
    'Plano de Entrega': TextEditingController(),
    'Categoria': TextEditingController(),
  };
  final formKey = GlobalKey<FormState>();
  final fields = RegisterField.fields;
  final categories = [
    'Açaí',
    'Lanches',
    'Padarias',
    'Pizza',
    'Saudável',
    'Bolos e Doces',
    'Bebidas',
    'Vegetariana',
    'Italiana',
    'Sorvetes',
    'Asiática',
  ];

  @action
  Future<void>? addRestaurant() {
    restaurant.add({
      'name_Owner': controller['nome']?.text,
      'email_Owner': controller['email']?.text,
      'phone_Owner': controller['telefone']?.text,
      'CNPJ': controller['CNPJ']?.text,
      'company_name': controller['Razão Social']?.text,
      'social_name': controller['Nome da loja']?.text,
      'phone_restaurant': controller['Telefone da loja']?.text,
      'CEP': controller['CEP']?.text,
      'state': controller['Estado']?.text,
      'city': controller['Cidade']?.text,
      'district': controller['Bairro']?.text,
      'address': controller['Endereço']?.text,
      'number': controller['Número']?.text,
      'complement': controller['Complemento (Opcional)']?.text,
      'password': controller['Senha']?.text,
      'delivery_plan': controller['Plano de Entrega']?.text,
      'category': controller['Categoria']?.text,
    });
  }

  @observable
  var selectedCategory = 'Açaí';

  @action
  setSelectedCategory(newValue) {
    selectedCategory = newValue ?? 'Açaí';
    controller['Categoria']!.text = newValue;
  }

  @observable
  var selectedPlan = 'Plano Básico';

  @action
  void setSelectedPlan(String? selection) {
    selectedPlan = selection ?? availablePlans.first;
    controller['Plano de Entrega']!.text = selection ?? availablePlans.first;
  }

  @action
  void dispose() {
    controller.clear();
  }

  String? validatePassword() {
    if (controller['Confirmar Senha']?.text != controller['Senha']?.text) {
      return "Os campos diferem";
    }
    return null;
  }
}
