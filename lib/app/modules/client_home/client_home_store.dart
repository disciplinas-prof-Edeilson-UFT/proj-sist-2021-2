import 'package:mobx/mobx.dart';

part 'client_home_store.g.dart';

class ClientHomeStore = _ClientHomeStoreBase with _$ClientHomeStore;

abstract class _ClientHomeStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
