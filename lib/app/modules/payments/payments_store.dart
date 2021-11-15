import 'package:mobx/mobx.dart';

part 'payments_store.g.dart';

class PaymentsStore = _PaymentsStoreBase with _$PaymentsStore;
abstract class _PaymentsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}