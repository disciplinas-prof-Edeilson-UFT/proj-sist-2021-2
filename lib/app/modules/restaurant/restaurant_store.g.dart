// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantStore on _RestaurantStoreBase, Store {
  final _$restaurantAtom = Atom(name: '_RestaurantStoreBase.restaurant');

  @override
  AppResponse<Restaurant> get restaurant {
    _$restaurantAtom.reportRead();
    return super.restaurant;
  }

  @override
  set restaurant(AppResponse<Restaurant> value) {
    _$restaurantAtom.reportWrite(value, super.restaurant, () {
      super.restaurant = value;
    });
  }

  final _$productsAtom = Atom(name: '_RestaurantStoreBase.products');

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RestaurantStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getProductsAsyncAction =
      AsyncAction('_RestaurantStoreBase.getProducts');

  @override
  Future<List<Product>> getProducts(String searchTitle) {
    return _$getProductsAsyncAction.run(() => super.getProducts(searchTitle));
  }

  final _$saveAsyncAction = AsyncAction('_RestaurantStoreBase.save');

  @override
  Future<dynamic> save(String id) {
    return _$saveAsyncAction.run(() => super.save(id));
  }

  final _$receiveRestaurantInfoAsyncAction =
      AsyncAction('_RestaurantStoreBase.receiveRestaurantInfo');

  @override
  Future<void> receiveRestaurantInfo(String? uid) {
    return _$receiveRestaurantInfoAsyncAction
        .run(() => super.receiveRestaurantInfo(uid));
  }

  @override
  String toString() {
    return '''
restaurant: ${restaurant},
products: ${products},
errorMessage: ${errorMessage}
    ''';
  }
}
