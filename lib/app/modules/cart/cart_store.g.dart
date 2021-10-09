// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$placeholderAtom = Atom(name: '_CartStoreBase.placeholder');

  @override
  List<Item> get placeholder {
    _$placeholderAtom.reportRead();
    return super.placeholder;
  }

  @override
  set placeholder(List<Item> value) {
    _$placeholderAtom.reportWrite(value, super.placeholder, () {
      super.placeholder = value;
    });
  }

  @override
  String toString() {
    return '''
placeholder: ${placeholder}
    ''';
  }
}
