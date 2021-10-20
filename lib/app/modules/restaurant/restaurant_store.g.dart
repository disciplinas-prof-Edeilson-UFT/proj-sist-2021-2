// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantStore on _RestaurantStoreBase, Store {
  final _$restaurantAtom = Atom(name: '_RestaurantStoreBase.restaurant');

  @override
  Restaurant? get restaurant {
    _$restaurantAtom.reportRead();
    return super.restaurant;
  }

  @override
  set restaurant(Restaurant? value) {
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

  final _$getProductsAsyncAction =
      AsyncAction('_RestaurantStoreBase.getProducts');

  @override
  Future<List<Product>> getProducts(String searchTitle) {
    return _$getProductsAsyncAction.run(() => super.getProducts(searchTitle));
  }

  final _$receiveRestaurantInfoAsyncAction =
      AsyncAction('_RestaurantStoreBase.receiveRestaurantInfo');

  @override
  Future<void> receiveRestaurantInfo(Restaurant info) {
    return _$receiveRestaurantInfoAsyncAction
        .run(() => super.receiveRestaurantInfo(info));
  }

  @override
  String toString() {
    return '''
restaurant: ${restaurant},
products: ${products}
    ''';
  }
}
