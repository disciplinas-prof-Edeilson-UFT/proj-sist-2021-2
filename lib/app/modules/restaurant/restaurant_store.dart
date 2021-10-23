import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_service_firestore.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;

abstract class _RestaurantStoreBase with Store {
  _RestaurantStoreBase(this.cartStore);

  final CartStore cartStore;
  final RestaurantServiceFirestore restaurantServiceFirestore = Modular.get();

  @observable
  Restaurant? restaurant;

  @observable
  List<Product> products = [];

  @action
  Future<List<Product>> getProducts(String searchTitle) async {
    products = await restaurantServiceFirestore.getProductsService(
        searchTitle, restaurant!.restaurantId);
    return products;
  }

  void addItem(Item item) {
    cartStore.addItem(item);
  }

  @action
  Future<void> receiveRestaurantInfo(Restaurant info) async {
    restaurant = info;
    await getProducts('');
  }
}
