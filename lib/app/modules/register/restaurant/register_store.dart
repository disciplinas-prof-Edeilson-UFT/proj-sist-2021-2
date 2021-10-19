import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable
  String name = '';

  @action
  void setName(String value) {
    name = value;
  }

  @observable
  String? phone;

  @action
  void setPhone(String value) {
    phone = value;
  }

  @observable
  String? email;

  @action
  void setEmail(String value) {
    email = value;
  }
}
