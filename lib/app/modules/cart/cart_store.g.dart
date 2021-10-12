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
  List<Item> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(List<Item> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  @override
  String toString() {
    return '''
itens: ${itens},
total: ${total}
    ''';
  }
}
