// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterClientStore on _RegisterStoreBase, Store {
  final _$confirmationResultAtom =
      Atom(name: '_RegisterStoreBase.confirmationResult');

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

  final _$validatorPhoneAtom = Atom(name: '_RegisterStoreBase.validatorPhone');

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

  final _$errorPhoneAtom = Atom(name: '_RegisterStoreBase.errorPhone');

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

  final _$errorMessageAtom = Atom(name: '_RegisterStoreBase.errorMessage');

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

  final _$registeredAtom = Atom(name: '_RegisterStoreBase.registered');

  @override
  bool? get registered {
    _$registeredAtom.reportRead();
    return super.registered;
  }

  @override
  set registered(bool? value) {
    _$registeredAtom.reportWrite(value, super.registered, () {
      super.registered = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_RegisterStoreBase.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$sendVerifyCodeAsyncAction =
      AsyncAction('_RegisterStoreBase.sendVerifyCode');

  @override
  Future<void> sendVerifyCode() {
    return _$sendVerifyCodeAsyncAction.run(() => super.sendVerifyCode());
  }

  final _$verifyCodeAsyncAction = AsyncAction('_RegisterStoreBase.verifyCode');

  @override
  Future<void> verifyCode() {
    return _$verifyCodeAsyncAction.run(() => super.verifyCode());
  }

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  void termsValidation() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.termsValidation');
    try {
      return super.termsValidation();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
confirmationResult: ${confirmationResult},
validatorPhone: ${validatorPhone},
errorPhone: ${errorPhone},
errorMessage: ${errorMessage},
registered: ${registered}
    ''';
  }
}
