// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_client_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateClientDataStore on _UpdateClientDataStoreBase, Store {
  final _$confirmationResultAtom =
      Atom(name: '_UpdateClientDataStoreBase.confirmationResult');

  @override
  ConfirmationResult? get confirmationResult {
    _$confirmationResultAtom.reportRead();
    return super.confirmationResult;
  }

  @override
  set confirmationResult(ConfirmationResult? value) {
    _$confirmationResultAtom.reportWrite(value, super.confirmationResult, () {
      super.confirmationResult = value;
    });
  }

  final _$validatorPhoneAtom =
      Atom(name: '_UpdateClientDataStoreBase.validatorPhone');

  @override
  bool? get validatorPhone {
    _$validatorPhoneAtom.reportRead();
    return super.validatorPhone;
  }

  @override
  set validatorPhone(bool? value) {
    _$validatorPhoneAtom.reportWrite(value, super.validatorPhone, () {
      super.validatorPhone = value;
    });
  }

  final _$errorPhoneAtom = Atom(name: '_UpdateClientDataStoreBase.errorPhone');

  @override
  String? get errorPhone {
    _$errorPhoneAtom.reportRead();
    return super.errorPhone;
  }

  @override
  set errorPhone(String? value) {
    _$errorPhoneAtom.reportWrite(value, super.errorPhone, () {
      super.errorPhone = value;
    });
  }

  final _$errorMessageAtom =
      Atom(name: '_UpdateClientDataStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$updatedAtom = Atom(name: '_UpdateClientDataStoreBase.updated');

  @override
  bool get updated {
    _$updatedAtom.reportRead();
    return super.updated;
  }

  @override
  set updated(bool value) {
    _$updatedAtom.reportWrite(value, super.updated, () {
      super.updated = value;
    });
  }

  final _$userAtom = Atom(name: '_UpdateClientDataStoreBase.user');

  @override
  Cliente? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Cliente? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$sendVerifyCodeAsyncAction =
      AsyncAction('_UpdateClientDataStoreBase.sendVerifyCode');

  @override
  Future<void> sendVerifyCode() {
    return _$sendVerifyCodeAsyncAction.run(() => super.sendVerifyCode());
  }

  final _$verifyCodeAsyncAction =
      AsyncAction('_UpdateClientDataStoreBase.verifyCode');

  @override
  Future<void> verifyCode() {
    return _$verifyCodeAsyncAction.run(() => super.verifyCode());
  }

  final _$checkDataAsyncAction =
      AsyncAction('_UpdateClientDataStoreBase.checkData');

  @override
  Future<void> checkData() {
    return _$checkDataAsyncAction.run(() => super.checkData());
  }

  final _$updateClientDataAsyncAction =
      AsyncAction('_UpdateClientDataStoreBase.updateClientData');

  @override
  Future<void> updateClientData() {
    return _$updateClientDataAsyncAction.run(() => super.updateClientData());
  }

  final _$getClientDataAsyncAction =
      AsyncAction('_UpdateClientDataStoreBase.getClientData');

  @override
  Future<void> getClientData() {
    return _$getClientDataAsyncAction.run(() => super.getClientData());
  }

  @override
  String toString() {
    return '''
confirmationResult: ${confirmationResult},
validatorPhone: ${validatorPhone},
errorPhone: ${errorPhone},
errorMessage: ${errorMessage},
updated: ${updated},
user: ${user}
    ''';
  }
}
