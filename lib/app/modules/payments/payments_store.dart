import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'payments_store.g.dart';

class PaymentsStore = _PaymentsStoreBase with _$PaymentsStore;
abstract class _PaymentsStoreBase with Store {

  TextEditingController numeroCartaoControlle = TextEditingController();
  TextEditingController nomeImpressoControlle = TextEditingController();
  TextEditingController apelidoControlle = TextEditingController();
  TextEditingController validadeControlle = TextEditingController();
  TextEditingController cvvControlle = TextEditingController();
  TextEditingController cpfCnpjControlle = TextEditingController();

  @observable
  String type = '';
  @action
  setType(String value) => type = value;

  @observable
  bool typeCardChosen = false;
  @action
  setTypeCardChosen(bool value) => typeCardChosen = value; 

  @observable 
  bool dataInvalid = false;
  @action
  void setDataInvalid(bool value) => dataInvalid = value;

  @observable
  bool isValidNumCard = false;
  @action 
  void setValidNumCard(bool value) => isValidNumCard = value;

  @observable
  bool isValidNomeImpresso = false;
  @action 
  void setValidNomeImpresso(bool value) => isValidNomeImpresso = value;

  @observable
  bool isValidApelido = false;
  @action 
  void setValidApelido(bool value) => isValidApelido = value;

  @observable
  bool isValidValidade = false;
  @action 
  void setValidValidade(bool value) => isValidValidade = value;

  @observable
  bool isValidCVV = false;
  @action 
  void setValidCVV(bool value) => isValidCVV = value;

  @observable
  bool isValidCpfCnpj = false;
  @action 
  void setValidCpfCnpj(bool value) => isValidCpfCnpj = value;

  bool isValidData(){
    if(
      isValidNumCard && 
      isValidNomeImpresso && 
      isValidApelido && 
      isValidValidade && 
      isValidCVV && 
      isValidCpfCnpj
    ){
      return true;
    }
    return false;
  }

  void clear(){

    isValidNumCard = false;
    isValidNomeImpresso = false;
    isValidApelido = false;
    isValidValidade = false;
    isValidCVV = false;
    isValidCpfCnpj = false;

    numeroCartaoControlle.clear();
    nomeImpressoControlle.clear();
    apelidoControlle.clear();
    validadeControlle.clear();
    cvvControlle.clear();
    cpfCnpjControlle.clear();
  }

}