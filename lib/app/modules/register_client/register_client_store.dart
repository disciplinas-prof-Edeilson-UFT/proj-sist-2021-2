import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/cliente.dart';
import 'package:pscomidas/app/modules/register_client/pages/confirm_phone/confirm_phone_page.dart';
import 'package:pscomidas/app/modules/register_client/register_client_repository.dart';

part 'register_client_store.g.dart';

class RegisterClientStore = _RegisterStoreBase with _$RegisterClientStore;

abstract class _RegisterStoreBase with Store {
  final _repository = Modular.get<RegisterClientRepository>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();

  @observable
  String? errorMessage;

  @observable
  bool? registered;

  @action
  Future<void> register() async {
    try {
      Cliente user = Cliente(
        name: nameController.text,
        cpf: cpfController.text,
        email: emailController.text,
      );
      if (await _repository.registerClient(
        user,
        passwordController.text,
      ) is UserCredential) {
        registered = true;
      }
    } catch (e) {
      registered = false;
      errorMessage = e.toString();
    }
  }

  void goToConfirmPhone() {
    Modular.to.navigate(ConfirmPhonePage.routeName);
  }

  @action
  void dispose() {}
}
