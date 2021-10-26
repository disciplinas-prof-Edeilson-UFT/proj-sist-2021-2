// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantHomeStore on _RestaurantHomeStoreBase, Store {
  Computed<String>? _$toggleTextComputed;

  @override
  String get toggleText =>
      (_$toggleTextComputed ??= Computed<String>(() => super.toggleText,
              name: '_RestaurantHomeStoreBase.toggleText'))
          .value;

  final _$isOpenAtom = Atom(name: '_RestaurantHomeStoreBase.isOpen');

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  final _$imageReceiverAsyncAction =
      AsyncAction('_RestaurantHomeStoreBase.imageReceiver');

  @override
  Future<dynamic> imageReceiver(dynamic e) {
    return _$imageReceiverAsyncAction.run(() => super.imageReceiver(e));
  }

  final _$_RestaurantHomeStoreBaseActionController =
      ActionController(name: '_RestaurantHomeStoreBase');

  @override
  void toggleOpen() {
    final _$actionInfo = _$_RestaurantHomeStoreBaseActionController.startAction(
        name: '_RestaurantHomeStoreBase.toggleOpen');
    try {
      return super.toggleOpen();
    } finally {
      _$_RestaurantHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOpen: ${isOpen},
toggleText: ${toggleText}
    ''';
  }
}
