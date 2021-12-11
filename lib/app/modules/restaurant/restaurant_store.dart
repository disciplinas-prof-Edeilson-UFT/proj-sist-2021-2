// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/utils/app_response.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_service_firestore.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;

abstract class _RestaurantStoreBase with Store {
  _RestaurantStoreBase(this.cartStore);

  final Storage _localStorage = window.localStorage;

  final CartStore cartStore;
  final RestaurantServiceFirestore restaurantServiceFirestore = Modular.get();

  @observable
  AppResponse<Restaurant> restaurant = AppResponse<Restaurant>();

  @observable
  List<Product> products = [];

  @observable
  String? errorMessage;

  @action
  Future<List<Product>> getProducts(String searchTitle) async {
    products = await restaurantServiceFirestore.getProductsService(
        searchTitle, restaurant.body!.restaurantId);
    return products;
  }

  void addItem(Item item) {
    cartStore.addItem(item);
  }

  @action
  Future save(String id) async {
    _localStorage['selected_id'] = id;
  }

  Future<String> get getId async => _localStorage['selected_id']!;

  @action
  Future<void> receiveRestaurantInfo(String? uid) async {
    try {
      if (uid == null || uid.isEmpty) {
        uid = await getId;
      } else {
        save(uid);
      }
      final response = await restaurantServiceFirestore.fetchRestaurant(uid);
      restaurant = AppResponse.completed(response);
      await getProducts('');
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
  }
}
