import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/repositories/register_restaurant/register_repository.dart';
import 'pages/register_shop/register_field.dart';
part 'restaurant_register_store.g.dart';

class RestaurantRegisterStore = _RestaurantRegisterStore
    with _$RestaurantRegisterStore;

abstract class _RestaurantRegisterStore with Store {
  var availablePlans = ['Plano Básico', 'Plano Entrega'];

  final String userCity = "Palmas";

  registrar() async {
    final RegisterRepository registerRepository = RegisterRepository();
    var credential = await registerRepository.signUp(controller);
    await registerRepository.addRestaurant(credential.user!.uid, controller);
    await registerRepository.addUser(credential.user!.uid, controller);
  }

  @observable
  String registerErrorMessage = '';

  @action
  setRegisterErrorMessage(newValue) {
    registerErrorMessage = newValue ?? '';
  }

  Future<bool> dataIsUnique() async {
    final RegisterRepository registerRepository = RegisterRepository();
    var email = controller['Email']?.text ?? '';
    var uniqueEmail = email.isNotEmpty
        ? (await registerRepository.isUniqueEmail(email)) ?? false
        : false;

    var cnpj = controller['CNPJ']?.text ?? '';
    var uniqueRestaurant = cnpj.isNotEmpty
        ? (await registerRepository.isUniqueCNPJ(cnpj)) ?? false
        : false;

    if (uniqueEmail && uniqueRestaurant) {
      return true;
    } else if (uniqueRestaurant) {
      setRegisterErrorMessage(
          'O email pertence a outra conta. Tente fazer login, ou inserir um email diferente.');
      return false;
    } else if (uniqueEmail) {
      setRegisterErrorMessage(
          'O CNPJ pertence a outra conta. Tente fazer login, ou inserir um CNPJ diferente.');
      return false;
    } else {
      setRegisterErrorMessage(
          'O CNPJ e o email pertencem a outra conta. Tente fazer login, ou inserir dados diferentes.');
      return false;
    }
  }

  Map<String, TextEditingController> controller = {
    'Nome': TextEditingController(),
    'Email': TextEditingController(),
    'Telefone': TextEditingController(),
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
    controller.forEach((key, value) => value.clear());
  }

  String? validatePassword() {
    if (controller['Confirmar Senha']?.text != controller['Senha']?.text) {
      if (controller['Confirmar Senha']!.text.isEmpty) {
        return null;
      }
      return "Os campos diferem";
    }
    return null;
  }
}
