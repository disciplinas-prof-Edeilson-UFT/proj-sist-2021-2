// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_CartStoreBase.total'))
      .value;

  final _$itensAtom = Atom(name: '_CartStoreBase.itens');

  @override
  ObservableList<Item> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(ObservableList<Item> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$itensPedidoAtom = Atom(name: '_CartStoreBase.itensPedido');

  @override
  ObservableList<Item> get itensPedido {
    _$itensPedidoAtom.reportRead();
    return super.itensPedido;
  }

  @override
  set itensPedido(ObservableList<Item> value) {
    _$itensPedidoAtom.reportWrite(value, super.itensPedido, () {
      super.itensPedido = value;
    });
  }

  final _$listaPedidoAtom = Atom(name: '_CartStoreBase.listaPedido');

  @override
  Order? get listaPedido {
    _$listaPedidoAtom.reportRead();
    return super.listaPedido;
  }

  @override
  set listaPedido(Order? value) {
    _$listaPedidoAtom.reportWrite(value, super.listaPedido, () {
      super.listaPedido = value;
    });
  }

  final _$cadastroTesteAsyncAction =
      AsyncAction('_CartStoreBase.cadastroTeste');

  @override
  Future<dynamic> cadastroTeste() {
    return _$cadastroTesteAsyncAction.run(() => super.cadastroTeste());
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void addItem(Item item) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String iditemremovido) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.removeItem');
    try {
      return super.removeItem(iditemremovido);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editItem(Item itemEditing) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.editItem');
    try {
      return super.editItem(itemEditing);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void transferirItens() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.transferirItens');
    try {
      return super.transferirItens();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleaningItemsCart() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.cleaningItemsCart');
    try {
      return super.cleaningItemsCart();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itens: ${itens},
itensPedido: ${itensPedido},
listaPedido: ${listaPedido},
total: ${total}
    ''';
  }
}
