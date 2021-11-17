// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CancelStore on _CancelStoreBase, Store {
  final _$paymentsAtom = Atom(name: '_CancelStoreBase.payments');

  @override
  bool get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(bool value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  final _$adressAtom = Atom(name: '_CancelStoreBase.adress');

  @override
  bool get adress {
    _$adressAtom.reportRead();
    return super.adress;
  }

  @override
  set adress(bool value) {
    _$adressAtom.reportWrite(value, super.adress, () {
      super.adress = value;
    });
  }

  final _$pratoErradoAtom = Atom(name: '_CancelStoreBase.pratoErrado');

  @override
  bool get pratoErrado {
    _$pratoErradoAtom.reportRead();
    return super.pratoErrado;
  }

  @override
  set pratoErrado(bool value) {
    _$pratoErradoAtom.reportWrite(value, super.pratoErrado, () {
      super.pratoErrado = value;
    });
  }

  final _$compraErradaAtom = Atom(name: '_CancelStoreBase.compraErrada');

  @override
  bool get compraErrada {
    _$compraErradaAtom.reportRead();
    return super.compraErrada;
  }

  @override
  set compraErrada(bool value) {
    _$compraErradaAtom.reportWrite(value, super.compraErrada, () {
      super.compraErrada = value;
    });
  }

  final _$horarioAtom = Atom(name: '_CancelStoreBase.horario');

  @override
  bool get horario {
    _$horarioAtom.reportRead();
    return super.horario;
  }

  @override
  set horario(bool value) {
    _$horarioAtom.reportWrite(value, super.horario, () {
      super.horario = value;
    });
  }

  final _$outrosAtom = Atom(name: '_CancelStoreBase.outros');

  @override
  bool get outros {
    _$outrosAtom.reportRead();
    return super.outros;
  }

  @override
  set outros(bool value) {
    _$outrosAtom.reportWrite(value, super.outros, () {
      super.outros = value;
    });
  }

  final _$_CancelStoreBaseActionController =
      ActionController(name: '_CancelStoreBase');

  @override
  void setCheckedPayments(bool value) {
    final _$actionInfo = _$_CancelStoreBaseActionController.startAction(
        name: '_CancelStoreBase.setCheckedPayments');
    try {
      return super.setCheckedPayments(value);
    } finally {
      _$_CancelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedAdress(bool value) {
    final _$actionInfo = _$_CancelStoreBaseActionController.startAction(
        name: '_CancelStoreBase.setCheckedAdress');
    try {
      return super.setCheckedAdress(value);
    } finally {
      _$_CancelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedPrato(bool value) {
    final _$actionInfo = _$_CancelStoreBaseActionController.startAction(
        name: '_CancelStoreBase.setCheckedPrato');
    try {
      return super.setCheckedPrato(value);
    } finally {
      _$_CancelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedCompra(bool value) {
    final _$actionInfo = _$_CancelStoreBaseActionController.startAction(
        name: '_CancelStoreBase.setCheckedCompra');
    try {
      return super.setCheckedCompra(value);
    } finally {
      _$_CancelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedHorario(bool value) {
    final _$actionInfo = _$_CancelStoreBaseActionController.startAction(
        name: '_CancelStoreBase.setCheckedHorario');
    try {
      return super.setCheckedHorario(value);
    } finally {
      _$_CancelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedOutros(bool value) {
    final _$actionInfo = _$_CancelStoreBaseActionController.startAction(
        name: '_CancelStoreBase.setCheckedOutros');
    try {
      return super.setCheckedOutros(value);
    } finally {
      _$_CancelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
adress: ${adress},
pratoErrado: ${pratoErrado},
compraErrada: ${compraErrada},
horario: ${horario},
outros: ${outros}
    ''';
  }
}
