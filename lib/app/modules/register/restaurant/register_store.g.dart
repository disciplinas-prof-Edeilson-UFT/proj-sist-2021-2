// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantRegisterStore on _RestaurantRegisterStore, Store {
  final _$selectedCategoryAtom = Atom(name: '_RegisterStore.selectedCategory');

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$selectedPlanAtom = Atom(name: '_RegisterStore.selectedPlan');

  @override
  String get selectedPlan {
    _$selectedPlanAtom.reportRead();
    return super.selectedPlan;
  }

  @override
  set selectedPlan(String value) {
    _$selectedPlanAtom.reportWrite(value, super.selectedPlan, () {
      super.selectedPlan = value;
    });
  }

  final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore');

  @override
  Future<void>? addRestaurant() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.addRestaurant');
    try {
      return super.addRestaurant();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedCategory(dynamic newValue) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(newValue);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPlan(String? selection) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setSelectedPlan');
    try {
      return super.setSelectedPlan(selection);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
selectedPlan: ${selectedPlan}
    ''';
  }
}
