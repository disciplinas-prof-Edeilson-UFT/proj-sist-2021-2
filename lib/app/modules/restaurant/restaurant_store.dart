import 'package:mobx/mobx.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStoreBase with _$RestaurantStore;
abstract class _RestaurantStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}