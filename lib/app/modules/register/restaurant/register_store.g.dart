// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  final _$selectedValueAtom = Atom(name: '_RegisterStore.selectedValue');

  @override
  String get selectedValue {
    _$selectedValueAtom.reportRead();
    return super.selectedValue;
  }

  @override
  set selectedValue(String value) {
    _$selectedValueAtom.reportWrite(value, super.selectedValue, () {
      super.selectedValue = value;
    });
  }

  final _$characterAtom = Atom(name: '_RegisterStore.character');

  @override
  SingingCharacter? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(SingingCharacter? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore');

  @override
  Future<void>? addRestaurant(Map<String, TextEditingController> controller) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.addRestaurant');
    try {
      return super.addRestaurant(controller);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedValue(dynamic newValue, dynamic controller) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setSelectedValue');
    try {
      return super.setSelectedValue(newValue, controller);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlan(dynamic newValue, dynamic text, dynamic controller) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setPlan');
    try {
      return super.setPlan(newValue, text, controller);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedValue: ${selectedValue},
character: ${character}
    ''';
  }
}
