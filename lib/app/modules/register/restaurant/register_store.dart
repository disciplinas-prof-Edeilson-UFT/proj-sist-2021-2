import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RestaurantRegisterStore = _RestaurantRegisterStoreBase with _$RestaurantRegisterStore;
abstract class _RestaurantRegisterStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}