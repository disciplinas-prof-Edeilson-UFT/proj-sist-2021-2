import 'package:mobx/mobx.dart';

part 'update_client_data_store.g.dart';

class ChangeClientDataStore = _ChangeClientDataStoreBase
    with _$ChangeClientDataStore;

abstract class _ChangeClientDataStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
