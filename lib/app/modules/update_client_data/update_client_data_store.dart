import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/register_client/register_client_repository.dart';

part 'update_client_data_store.g.dart';

class UpdateClientDataStore = _UpdateClientDataStoreBase
    with _$UpdateClientDataStore;

abstract class _UpdateClientDataStoreBase with Store {
  final _registerRepository = Modular.get<RegisterClientRepository>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @observable
  ConfirmationResult? confirmationResult;

  @observable
  bool? validatorPhone;

  @observable
  String? errorPhone;

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
}
