import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
part 'product_store.g.dart';

class ProductOptionsStore = _ProductOptionsStoreBase with _$ProductOptionsStore;

abstract class _ProductOptionsStoreBase with Store {
  final RestaurantStore restaurantStore;

  _ProductOptionsStoreBase(this.restaurantStore);

  @observable
  TextEditingController observation = TextEditingController();

  @observable
  int quantity = 1;

  @action
  void increment() {
    quantity = quantity + 1;
  }

  @action
  void decrement() {
    if (quantity > 1) {
      quantity = quantity - 1;
    }
  }

  @action
  void makeItem(Product product) {
    String itemid = Random().nextInt(999).toString();
    Item item = Item(
      product,
      quantity,
      itemid,
    );
    restaurantStore.addItem(item);
  }

  dispose() {
    quantity = 1;
    // TODO: Verificar erro
    // observation.dispose();
  }
}
