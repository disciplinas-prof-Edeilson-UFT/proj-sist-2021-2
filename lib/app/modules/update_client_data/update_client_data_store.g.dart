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

  @override
  String toString() {
    return '''
confirmationResult: ${confirmationResult},
validatorPhone: ${validatorPhone},
errorPhone: ${errorPhone}
    ''';
  }
}
