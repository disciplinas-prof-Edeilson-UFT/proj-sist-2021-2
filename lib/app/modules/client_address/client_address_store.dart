import 'package:mobx/mobx.dart';

part 'client_address_store.g.dart';

class ClientAddressStore = _ClientAddressStoreBase with _$ClientAddressStore;

abstract class _ClientAddressStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
