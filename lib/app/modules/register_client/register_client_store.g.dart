// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterClientStore on _RegisterStoreBase, Store {
  Computed<bool>? _$iAgreeComputed;

  @override
  bool get iAgree => (_$iAgreeComputed ??=
          Computed<bool>(() => super.iAgree, name: '_RegisterStoreBase.iAgree'))
      .value;

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

  final _$goCepAtom = Atom(name: '_RegisterStoreBase.goCep');

  @override
  bool get goCep {
    _$goCepAtom.reportRead();
    return super.goCep;
  }

  @override
  set goCep(bool value) {
    _$goCepAtom.reportWrite(value, super.goCep, () {
      super.goCep = value;
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

  final _$_agreeAtom = Atom(name: '_RegisterStoreBase._agree');

  @override
  bool get _agree {
    _$_agreeAtom.reportRead();
    return super._agree;
  }

  @override
  set _agree(bool value) {
    _$_agreeAtom.reportWrite(value, super._agree, () {
      super._agree = value;
    });
  }

  final _$addressTypeAtom = Atom(name: '_RegisterStoreBase.addressType');

  @override
  FilterAddressType? get addressType {
    _$addressTypeAtom.reportRead();
    return super.addressType;
  }

  @override
  set addressType(FilterAddressType? value) {
    _$addressTypeAtom.reportWrite(value, super.addressType, () {
      super.addressType = value;
    });
  }

  final _$addressAtom = Atom(name: '_RegisterStoreBase.address');

  @override
  AppResponse<DeliveryAt> get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(AppResponse<DeliveryAt> value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$findCEPAsyncAction = AsyncAction('_RegisterStoreBase.findCEP');

  @override
  Future findCEP() {
    return _$findCEPAsyncAction.run(() => super.findCEP());
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
  dynamic agree() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.agree');
    try {
      return super.agree();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cepValid() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.cepValid');
    try {
      return super.cepValid();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
goCep: ${goCep},
registered: ${registered},
addressType: ${addressType},
address: ${address},
iAgree: ${iAgree}
    ''';
  }
}
