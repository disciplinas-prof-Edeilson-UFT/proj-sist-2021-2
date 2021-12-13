// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentsStore on _PaymentsStoreBase, Store {
  final _$dataInvalidAtom = Atom(name: '_PaymentsStoreBase.dataInvalid');

  @override
  bool get dataInvalid {
    _$dataInvalidAtom.reportRead();
    return super.dataInvalid;
  }

  @override
  set dataInvalid(bool value) {
    _$dataInvalidAtom.reportWrite(value, super.dataInvalid, () {
      super.dataInvalid = value;
    });
  }

  final _$isValidNumCardAtom = Atom(name: '_PaymentsStoreBase.isValidNumCard');

  @override
  bool get isValidNumCard {
    _$isValidNumCardAtom.reportRead();
    return super.isValidNumCard;
  }

  @override
  set isValidNumCard(bool value) {
    _$isValidNumCardAtom.reportWrite(value, super.isValidNumCard, () {
      super.isValidNumCard = value;
    });
  }

  final _$isValidNomeImpressoAtom =
      Atom(name: '_PaymentsStoreBase.isValidNomeImpresso');

  @override
  bool get isValidNomeImpresso {
    _$isValidNomeImpressoAtom.reportRead();
    return super.isValidNomeImpresso;
  }

  @override
  set isValidNomeImpresso(bool value) {
    _$isValidNomeImpressoAtom.reportWrite(value, super.isValidNomeImpresso, () {
      super.isValidNomeImpresso = value;
    });
  }

  final _$isValidValidadeAtom =
      Atom(name: '_PaymentsStoreBase.isValidValidade');

  @override
  bool get isValidValidade {
    _$isValidValidadeAtom.reportRead();
    return super.isValidValidade;
  }

  @override
  set isValidValidade(bool value) {
    _$isValidValidadeAtom.reportWrite(value, super.isValidValidade, () {
      super.isValidValidade = value;
    });
  }

  final _$isValidCVVAtom = Atom(name: '_PaymentsStoreBase.isValidCVV');

  @override
  bool get isValidCVV {
    _$isValidCVVAtom.reportRead();
    return super.isValidCVV;
  }

  @override
  set isValidCVV(bool value) {
    _$isValidCVVAtom.reportWrite(value, super.isValidCVV, () {
      super.isValidCVV = value;
    });
  }

  final _$cardsAtom = Atom(name: '_PaymentsStoreBase.cards');

  @override
  List<NewCard> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(List<NewCard> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$cartaoAdicionarAsyncAction =
      AsyncAction('_PaymentsStoreBase.cartaoAdicionar');

  @override
  Future<dynamic> cartaoAdicionar() {
    return _$cartaoAdicionarAsyncAction.run(() => super.cartaoAdicionar());
  }

  final _$_PaymentsStoreBaseActionController =
      ActionController(name: '_PaymentsStoreBase');

  @override
  void setDataInvalid(bool value) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.setDataInvalid');
    try {
      return super.setDataInvalid(value);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidNumCard(bool value) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.setValidNumCard');
    try {
      return super.setValidNumCard(value);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidNomeImpresso(bool value) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.setValidNomeImpresso');
    try {
      return super.setValidNomeImpresso(value);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidValidade(bool value) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.setValidValidade');
    try {
      return super.setValidValidade(value);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidCVV(bool value) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.setValidCVV');
    try {
      return super.setValidCVV(value);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addCardList(NewCard card) {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.addCardList');
    try {
      return super.addCardList(card);
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearCardList() {
    final _$actionInfo = _$_PaymentsStoreBaseActionController.startAction(
        name: '_PaymentsStoreBase.clearCardList');
    try {
      return super.clearCardList();
    } finally {
      _$_PaymentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataInvalid: ${dataInvalid},
isValidNumCard: ${isValidNumCard},
isValidNomeImpresso: ${isValidNomeImpresso},
isValidValidade: ${isValidValidade},
isValidCVV: ${isValidCVV},
cards: ${cards}
    ''';
  }
}
