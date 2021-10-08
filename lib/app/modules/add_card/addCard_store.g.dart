// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addCard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddCardStore on _AddCardStoreBase, Store {
  final _$typeAtom = Atom(name: '_AddCardStoreBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$numero_cartaoAtom = Atom(name: '_AddCardStoreBase.numero_cartao');

  @override
  String get numero_cartao {
    _$numero_cartaoAtom.reportRead();
    return super.numero_cartao;
  }

  @override
  set numero_cartao(String value) {
    _$numero_cartaoAtom.reportWrite(value, super.numero_cartao, () {
      super.numero_cartao = value;
    });
  }

  final _$nome_impressoAtom = Atom(name: '_AddCardStoreBase.nome_impresso');

  @override
  String get nome_impresso {
    _$nome_impressoAtom.reportRead();
    return super.nome_impresso;
  }

  @override
  set nome_impresso(String value) {
    _$nome_impressoAtom.reportWrite(value, super.nome_impresso, () {
      super.nome_impresso = value;
    });
  }

  final _$apelidoAtom = Atom(name: '_AddCardStoreBase.apelido');

  @override
  String get apelido {
    _$apelidoAtom.reportRead();
    return super.apelido;
  }

  @override
  set apelido(String value) {
    _$apelidoAtom.reportWrite(value, super.apelido, () {
      super.apelido = value;
    });
  }

  final _$validadeAtom = Atom(name: '_AddCardStoreBase.validade');

  @override
  String get validade {
    _$validadeAtom.reportRead();
    return super.validade;
  }

  @override
  set validade(String value) {
    _$validadeAtom.reportWrite(value, super.validade, () {
      super.validade = value;
    });
  }

  final _$cvvAtom = Atom(name: '_AddCardStoreBase.cvv');

  @override
  String get cvv {
    _$cvvAtom.reportRead();
    return super.cvv;
  }

  @override
  set cvv(String value) {
    _$cvvAtom.reportWrite(value, super.cvv, () {
      super.cvv = value;
    });
  }

  final _$cpf_cnpjAtom = Atom(name: '_AddCardStoreBase.cpf_cnpj');

  @override
  String get cpf_cnpj {
    _$cpf_cnpjAtom.reportRead();
    return super.cpf_cnpj;
  }

  @override
  set cpf_cnpj(String value) {
    _$cpf_cnpjAtom.reportWrite(value, super.cpf_cnpj, () {
      super.cpf_cnpj = value;
    });
  }

  final _$_AddCardStoreBaseActionController =
      ActionController(name: '_AddCardStoreBase');

  @override
  dynamic setType(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero_cartao(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setNumero_cartao');
    try {
      return super.setNumero_cartao(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome_impresso(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setNome_impresso');
    try {
      return super.setNome_impresso(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApelido(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setApelido');
    try {
      return super.setApelido(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidade(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setValidade');
    try {
      return super.setValidade(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCvv(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setCvv');
    try {
      return super.setCvv(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf_cnpj(String value) {
    final _$actionInfo = _$_AddCardStoreBaseActionController.startAction(
        name: '_AddCardStoreBase.setCpf_cnpj');
    try {
      return super.setCpf_cnpj(value);
    } finally {
      _$_AddCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
numero_cartao: ${numero_cartao},
nome_impresso: ${nome_impresso},
apelido: ${apelido},
validade: ${validade},
cvv: ${cvv},
cpf_cnpj: ${cpf_cnpj}
    ''';
  }
}
