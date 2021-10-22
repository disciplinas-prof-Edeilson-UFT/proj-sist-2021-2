import 'package:mobx/mobx.dart';
part 'cancel_checked.g.dart';

class CancelChecked = _CancelCheckedBase with _$CancelChecked;

abstract class _CancelCheckedBase with Store {
  
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
  bool prato_errado = false;
  @action
  void setCheckedPrato(bool value) => prato_errado = value;

  // comprei sem querer
  @observable 
  bool compra_errada = false;
  @action
  void setCheckedCompra(bool value) => compra_errada = value;

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

  bool confirm(){
    if(payments || adress || prato_errado || compra_errada || horario || outros){
      return true;
    }
    return false;
  }

}