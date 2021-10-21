// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantRegisterStore on _RestaurantRegisterStoreBase, Store {
  final _$valueAtom = Atom(name: '_RestaurantRegisterStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$selectedCategoryAtom =
      Atom(name: '_RestaurantRegisterStoreBase.selectedCategory');

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

  final _$availablePlansAtom =
      Atom(name: '_RestaurantRegisterStoreBase.availablePlans');

  @override
  List<String> get availablePlans {
    _$availablePlansAtom.reportRead();
    return super.availablePlans;
  }

  @override
  set availablePlans(List<String> value) {
    _$availablePlansAtom.reportWrite(value, super.availablePlans, () {
      super.availablePlans = value;
    });
  }

  final _$selectedPlanAtom =
      Atom(name: '_RestaurantRegisterStoreBase.selectedPlan');

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

  final _$_RestaurantRegisterStoreBaseActionController =
      ActionController(name: '_RestaurantRegisterStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_RestaurantRegisterStoreBaseActionController
        .startAction(name: '_RestaurantRegisterStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_RestaurantRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String? selection) {
    final _$actionInfo = _$_RestaurantRegisterStoreBaseActionController
        .startAction(name: '_RestaurantRegisterStoreBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(selection);
    } finally {
      _$_RestaurantRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedPlan(String? selection) {
    final _$actionInfo = _$_RestaurantRegisterStoreBaseActionController
        .startAction(name: '_RestaurantRegisterStoreBase.setSelectedPlan');
    try {
      return super.setSelectedPlan(selection);
    } finally {
      _$_RestaurantRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
selectedCategory: ${selectedCategory},
availablePlans: ${availablePlans},
selectedPlan: ${selectedPlan}
    ''';
  }
}
