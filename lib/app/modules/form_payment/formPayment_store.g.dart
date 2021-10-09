// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formPayment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormPaymentStore on _FormPaymentStoreBase, Store {
  final _$listCardAtom = Atom(name: '_FormPaymentStoreBase.listCard');

  @override
  ObservableList<AddCardStore> get listCard {
    _$listCardAtom.reportRead();
    return super.listCard;
  }

  @override
  set listCard(ObservableList<AddCardStore> value) {
    _$listCardAtom.reportWrite(value, super.listCard, () {
      super.listCard = value;
    });
  }

  final _$_FormPaymentStoreBaseActionController =
      ActionController(name: '_FormPaymentStoreBase');

  @override
  dynamic addCard(AddCardStore model) {
    final _$actionInfo = _$_FormPaymentStoreBaseActionController.startAction(
        name: '_FormPaymentStoreBase.addCard');
    try {
      return super.addCard(model);
    } finally {
      _$_FormPaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCard: ${listCard}
    ''';
  }
}
