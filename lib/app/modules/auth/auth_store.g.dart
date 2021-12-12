// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<Future<bool>>? _$isClientComputed;

  @override
  Future<bool> get isClient =>
      (_$isClientComputed ??= Computed<Future<bool>>(() => super.isClient,
              name: '_AuthStoreBase.isClient'))
          .value;
  Computed<bool>? _$clientComputed;

  @override
  bool get client => (_$clientComputed ??=
          Computed<bool>(() => super.client, name: '_AuthStoreBase.client'))
      .value;

  final _$loggedUserAtom = Atom(name: '_AuthStoreBase.loggedUser');

  @override
  UserCredential? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(UserCredential? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$currentAddressAtom = Atom(name: '_AuthStoreBase.currentAddress');

  @override
  DeliveryAt? get currentAddress {
    _$currentAddressAtom.reportRead();
    return super.currentAddress;
  }

  @override
  set currentAddress(DeliveryAt? value) {
    _$currentAddressAtom.reportWrite(value, super.currentAddress, () {
      super.currentAddress = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_AuthStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$emailexisteAtom = Atom(name: '_AuthStoreBase.emailexiste');

  @override
  bool get emailexiste {
    _$emailexisteAtom.reportRead();
    return super.emailexiste;
  }

  @override
  set emailexiste(bool value) {
    _$emailexisteAtom.reportWrite(value, super.emailexiste, () {
      super.emailexiste = value;
    });
  }

  final _$loggedAtom = Atom(name: '_AuthStoreBase.logged');

  @override
  bool get logged {
    _$loggedAtom.reportRead();
    return super.logged;
  }

  @override
  set logged(bool value) {
    _$loggedAtom.reportWrite(value, super.logged, () {
      super.logged = value;
    });
  }

  final _$_isClientAtom = Atom(name: '_AuthStoreBase._isClient');

  @override
  bool get _isClient {
    _$_isClientAtom.reportRead();
    return super._isClient;
  }

  @override
  set _isClient(bool value) {
    _$_isClientAtom.reportWrite(value, super._isClient, () {
      super._isClient = value;
    });
  }

  final _$emailVerifiedAtom = Atom(name: '_AuthStoreBase.emailVerified');

  @override
  bool get emailVerified {
    _$emailVerifiedAtom.reportRead();
    return super.emailVerified;
  }

  @override
  set emailVerified(bool value) {
    _$emailVerifiedAtom.reportWrite(value, super.emailVerified, () {
      super.emailVerified = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$logFaceAsyncAction = AsyncAction('_AuthStoreBase.logFace');

  @override
  Future<void> logFace() {
    return _$logFaceAsyncAction.run(() => super.logFace());
  }

  final _$checkEmailVerifiedAsyncAction =
      AsyncAction('_AuthStoreBase.checkEmailVerified');

  @override
  Future<void> checkEmailVerified() {
    return _$checkEmailVerifiedAsyncAction
        .run(() => super.checkEmailVerified());
  }

  final _$logGoogleAsyncAction = AsyncAction('_AuthStoreBase.logGoogle');

  @override
  Future<void> logGoogle() {
    return _$logGoogleAsyncAction.run(() => super.logGoogle());
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void dispose() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
currentAddress: ${currentAddress},
errorMessage: ${errorMessage},
emailexiste: ${emailexiste},
logged: ${logged},
emailVerified: ${emailVerified},
isClient: ${isClient},
client: ${client}
    ''';
  }
}
