// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductOptionsStore on _ProductOptionsStoreBase, Store {
  final _$observationAtom = Atom(name: '_ProductOptionsStoreBase.observation');

  @override
  TextEditingController get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(TextEditingController value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  final _$quantityAtom = Atom(name: '_ProductOptionsStoreBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_ProductOptionsStoreBaseActionController =
      ActionController(name: '_ProductOptionsStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProductOptionsStoreBaseActionController.startAction(
        name: '_ProductOptionsStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProductOptionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_ProductOptionsStoreBaseActionController.startAction(
        name: '_ProductOptionsStoreBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_ProductOptionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeItem(Product product) {
    final _$actionInfo = _$_ProductOptionsStoreBaseActionController.startAction(
        name: '_ProductOptionsStoreBase.makeItem');
    try {
      return super.makeItem(product);
    } finally {
      _$_ProductOptionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observation: ${observation},
quantity: ${quantity}
    ''';
  }
}
