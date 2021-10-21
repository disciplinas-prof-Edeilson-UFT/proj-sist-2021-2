import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RestaurantRegisterStore = _RestaurantRegisterStoreBase
    with _$RestaurantRegisterStore;

abstract class _RestaurantRegisterStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @observable
  var selectedCategory = 'Açaí';

  @action
  void setSelectedCategory(String? selection) {
    selectedCategory = selection ?? 'Açaí';
  }

  @observable
  var availablePlans = ['Plano Básico', 'Plano Entrega'];

  @observable
  var selectedPlan = 'Plano Básico';

  @action
  void setSelectedPlan(String? selection) {
    selectedPlan = selection ?? availablePlans.first;
  }
}
