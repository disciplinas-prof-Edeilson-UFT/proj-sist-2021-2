// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_checked.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CancelChecked on _CancelCheckedBase, Store {
  final _$paymentsAtom = Atom(name: '_CancelCheckedBase.payments');

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

  final _$adressAtom = Atom(name: '_CancelCheckedBase.adress');

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

  final _$prato_erradoAtom = Atom(name: '_CancelCheckedBase.prato_errado');

  @override
  bool get prato_errado {
    _$prato_erradoAtom.reportRead();
    return super.prato_errado;
  }

  @override
  set prato_errado(bool value) {
    _$prato_erradoAtom.reportWrite(value, super.prato_errado, () {
      super.prato_errado = value;
    });
  }

  final _$compra_erradaAtom = Atom(name: '_CancelCheckedBase.compra_errada');

  @override
  bool get compra_errada {
    _$compra_erradaAtom.reportRead();
    return super.compra_errada;
  }

  @override
  set compra_errada(bool value) {
    _$compra_erradaAtom.reportWrite(value, super.compra_errada, () {
      super.compra_errada = value;
    });
  }

  final _$horarioAtom = Atom(name: '_CancelCheckedBase.horario');

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

  final _$outrosAtom = Atom(name: '_CancelCheckedBase.outros');

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

  final _$_CancelCheckedBaseActionController =
      ActionController(name: '_CancelCheckedBase');

  @override
  void setCheckedPayments(bool value) {
    final _$actionInfo = _$_CancelCheckedBaseActionController.startAction(
        name: '_CancelCheckedBase.setCheckedPayments');
    try {
      return super.setCheckedPayments(value);
    } finally {
      _$_CancelCheckedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedAdress(bool value) {
    final _$actionInfo = _$_CancelCheckedBaseActionController.startAction(
        name: '_CancelCheckedBase.setCheckedAdress');
    try {
      return super.setCheckedAdress(value);
    } finally {
      _$_CancelCheckedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedPrato(bool value) {
    final _$actionInfo = _$_CancelCheckedBaseActionController.startAction(
        name: '_CancelCheckedBase.setCheckedPrato');
    try {
      return super.setCheckedPrato(value);
    } finally {
      _$_CancelCheckedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedCompra(bool value) {
    final _$actionInfo = _$_CancelCheckedBaseActionController.startAction(
        name: '_CancelCheckedBase.setCheckedCompra');
    try {
      return super.setCheckedCompra(value);
    } finally {
      _$_CancelCheckedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedHorario(bool value) {
    final _$actionInfo = _$_CancelCheckedBaseActionController.startAction(
        name: '_CancelCheckedBase.setCheckedHorario');
    try {
      return super.setCheckedHorario(value);
    } finally {
      _$_CancelCheckedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckedOutros(bool value) {
    final _$actionInfo = _$_CancelCheckedBaseActionController.startAction(
        name: '_CancelCheckedBase.setCheckedOutros');
    try {
      return super.setCheckedOutros(value);
    } finally {
      _$_CancelCheckedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
adress: ${adress},
prato_errado: ${prato_errado},
compra_errada: ${compra_errada},
horario: ${horario},
outros: ${outros}
    ''';
  }
}
