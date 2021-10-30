import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/cliente.dart';
import 'package:pscomidas/app/modules/register/register_repository.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final _repository = Modular.get<RegisterRepository>();

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

  @action
  void dispose() {}
}
