// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$selectedFilterAtom = Atom(name: 'HomeStoreBase.selectedFilter');

  @override
  FilterType get selectedFilter {
    _$selectedFilterAtom.reportRead();
    return super.selectedFilter;
  }

  @override
  set selectedFilter(FilterType value) {
    _$selectedFilterAtom.reportWrite(value, super.selectedFilter, () {
      super.selectedFilter = value;
    });
  }

  final _$selectedCategoryAtom = Atom(name: 'HomeStoreBase.selectedCategory');

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

  final _$searchShopAtom = Atom(name: 'HomeStoreBase.searchShop');

  @override
  String get searchShop {
    _$searchShopAtom.reportRead();
    return super.searchShop;
  }

  @override
  set searchShop(String value) {
    _$searchShopAtom.reportWrite(value, super.searchShop, () {
      super.searchShop = value;
    });
  }

  final _$restaurantsAtom = Atom(name: 'HomeStoreBase.restaurants');

  @override
  List<Restaurant> get restaurants {
    _$restaurantsAtom.reportRead();
    return super.restaurants;
  }

  @override
  set restaurants(List<Restaurant> value) {
    _$restaurantsAtom.reportWrite(value, super.restaurants, () {
      super.restaurants = value;
    });
  }

  final _$getRestaurantsAsyncAction =
      AsyncAction('HomeStoreBase.getRestaurants');

  @override
  Future<List<Restaurant>> getRestaurants() {
    return _$getRestaurantsAsyncAction.run(() => super.getRestaurants());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setSelectedFilter(String? selection) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectedFilter');
    try {
      return super.setSelectedFilter(selection);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String? selection) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(selection);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedFilter: ${selectedFilter},
selectedCategory: ${selectedCategory},
searchShop: ${searchShop},
restaurants: ${restaurants}
    ''';
  }
}
