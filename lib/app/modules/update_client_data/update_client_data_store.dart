import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/register_client/register_client_repository.dart';

part 'update_client_data_store.g.dart';

class ChangeClientDataStore = _ChangeClientDataStoreBase
    with _$ChangeClientDataStore;

abstract class _ChangeClientDataStoreBase with Store {
  final _register_repository = Modular.get<RegisterClientRepository>();

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
        await _register_repository.verifyNumberForWeb(phoneController.text);
  }

  @action
  Future<void> verifyCode() async {
    try {
      validatorPhone = await _register_repository.verifyCodeForWeb(
          confirmationResult, codeController.text);
    } catch (e) {
      errorPhone = e.toString();
    }
  }
}
