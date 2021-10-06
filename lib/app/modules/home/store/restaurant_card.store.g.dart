// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_card.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantCardStore on _RestaurantCardStore, Store {
  final _$colorAtom = Atom(name: '_RestaurantCardStore.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$_RestaurantCardStoreActionController =
      ActionController(name: '_RestaurantCardStore');

  @override
  dynamic colordefine(_hovering) {
    final _$actionInfo = _$_RestaurantCardStoreActionController.startAction(
        name: '_RestaurantCardStore.colordefine');
    try {
      return super.colordefine(_hovering);
    } finally {
      _$_RestaurantCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
color: ${color}
    ''';
  }
}
