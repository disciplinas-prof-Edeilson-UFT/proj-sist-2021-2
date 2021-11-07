import 'package:mobx/mobx.dart';

part 'update_client_data_store.g.dart';

class UpdateClientDataStore = _UpdateClientDataStoreBase
    with _$UpdateClientDataStore;

abstract class _UpdateClientDataStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
