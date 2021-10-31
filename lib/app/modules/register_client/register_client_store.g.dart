// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterClientStore on _RegisterStoreBase, Store {
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

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

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
errorMessage: ${errorMessage},
registered: ${registered}
    ''';
  }
}
