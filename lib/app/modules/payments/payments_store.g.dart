// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentsStore on _PaymentsStoreBase, Store {
  final _$valueAtom = Atom(name: '_PaymentsStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_PaymentsStoreBaseActionController =
      ActionController(name: '_PaymentsStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
