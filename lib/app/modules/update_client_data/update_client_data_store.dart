import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/cliente.dart';
import 'package:pscomidas/app/global/repositories/update_client_data/update_client_data_repository.dart';
import 'package:pscomidas/app/modules/register_client/register_client_repository.dart';

import 'pages/confirm_new_phone_page.dart';

part 'update_client_data_store.g.dart';

class UpdateClientDataStore = _UpdateClientDataStoreBase
    with _$UpdateClientDataStore;

abstract class _UpdateClientDataStoreBase with Store {
  final _registerRepository = Modular.get<RegisterClientRepository>();
  final _updateClientData = Modular.get<UpdateClientRepository>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @observable
  ConfirmationResult? confirmationResult;

  @observable
  bool? validatorPhone;

  @observable
  String? errorPhone;

  @observable
  String? errorMessage;

  @observable
  bool updated = false;

  @observable
  Cliente? user;

  @action
  Future<void> sendVerifyCode() async {
    confirmationResult =
        await _registerRepository.verifyNumberForWeb(phoneController.text);
  }

  @action
  Future<void> verifyCode() async {
    try {
      validatorPhone = await _registerRepository.verifyCodeForWeb(
          confirmationResult, codeController.text);
    } catch (e) {
      errorPhone = e.toString();
    }
  }

  @action
  Future<void> checkData() async {
    if (await _registerRepository.checkData(
        emailController.text, phoneController.text, cpfController.text)) {
      goToConfirmPhone();
    } else {
      errorMessage =
          'Os dados pertencem a outra conta. Tente fazer login, ou corrigir os dados.';
    }
  }

  void redirectUpdate() {
    if (user!.phone != phoneController.text) {
      goToConfirmPhone();
    } else {
      updateClientData();
    }
  }

  void goToConfirmPhone() async {
    await sendVerifyCode();
    Modular.to.navigate(ConfirmNewPhonePage.routeName);
  }

  @action
  Future<void> updateClientData() async {
    try {
      Cliente user = Cliente(
        name: nameController.text,
        cpf: cpfController.text,
        email: emailController.text,
        phone: phoneController.text,
      );
      updated = await _updateClientData.updateClient(user);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  Future<void> getClientData() async {
    try {
      user = await _updateClientData.getClientData();
      nameController.text = user!.name;
      cpfController.text = user!.cpf;
      emailController.text = user!.email;
      phoneController.text = user!.phone;
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
