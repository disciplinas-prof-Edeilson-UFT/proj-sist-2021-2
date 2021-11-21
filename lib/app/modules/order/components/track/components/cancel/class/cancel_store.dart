import 'package:mobx/mobx.dart';
part 'cancel_store.g.dart';

class CancelStore = _CancelStoreBase with _$CancelStore;

abstract class _CancelStoreBase with Store {
  // forma de pagamento errado
  @observable
  bool payments = false;
  @action
  void setCheckedPayments(bool value) => payments = value;

  // endereço de entrega errado
  @observable
  bool adress = false;
  @action
  void setCheckedAdress(bool value) => adress = value;

  // o pedido escolhido está errado
  @observable
  bool pratoErrado = false;
  @action
  void setCheckedPrato(bool value) => pratoErrado = value;

  // comprei sem querer
  @observable
  bool compraErrada = false;
  @action
  void setCheckedCompra(bool value) => compraErrada = value;

  // horario de entrega é muito tarde
  @observable
  bool horario = false;
  @action
  void setCheckedHorario(bool value) => horario = value;

  // outros
  @observable
  bool outros = false;
  @action
  void setCheckedOutros(bool value) => outros = value;

  bool confirm() {
    if (payments ||
        adress ||
        pratoErrado ||
        compraErrada ||
        horario ||
        outros) {
      return true;
    }
    return false;
  }
}
