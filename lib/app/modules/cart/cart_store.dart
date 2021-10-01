import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  int value = 0;
  bool isColapsed = false;
  double maxWidth = 400;

  @action
  void increment() {
    value++;
  }
}
