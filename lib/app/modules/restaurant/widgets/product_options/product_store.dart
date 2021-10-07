import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
part 'product_store.g.dart';

class ProductOptionsStore = _ProductOptionsStoreBase with _$ProductOptionsStore;

abstract class _ProductOptionsStoreBase with Store {
  final RestaurantStore restaurantStore;

  _ProductOptionsStoreBase(this.restaurantStore);

  @observable
  int quantity = 0;

  @action
  void increment() {
    quantity = quantity + 1;
  }

  @action
  void decrement() {
    if (quantity > 0) {
      quantity = quantity - 1;
    }
  }

  dispose() {
    quantity = 0;
  }
}
