import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/repositories/paymentcard/payment_card.dart';

part 'payments_store.g.dart';

class PaymentsStore = _PaymentsStoreBase with _$PaymentsStore;

final PaymentCardRepository cardRepository =
    Modular.get<PaymentCardRepository>();

abstract class _PaymentsStoreBase with Store {
  TextEditingController numeroCartaoControlle = TextEditingController();
  TextEditingController nomeImpressoControlle = TextEditingController();
  TextEditingController validadeControlle = TextEditingController();
  TextEditingController cvvControlle = TextEditingController();

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
  bool isValidValidade = false;
  @action
  void setValidValidade(bool value) => isValidValidade = value;

  @observable
  bool isValidCVV = false;
  @action
  void setValidCVV(bool value) => isValidCVV = value;

  @observable 
  List<NewCard> cards = [];
  @action
  addCardList(NewCard card){
    cards.add(card);
  }

  @action 
  clearCardList(){
    cards.clear();
  }

  bool isValidData() {
    if (isValidNumCard &&
        isValidNomeImpresso &&
        isValidValidade &&
        isValidCVV ) {
      return true;
    }
    return false;
  }

  void clear() {
    isValidNumCard = false;
    isValidNomeImpresso = false;
    isValidValidade = false;
    isValidCVV = false;

    numeroCartaoControlle.clear();
    nomeImpressoControlle.clear();
    validadeControlle.clear();
    cvvControlle.clear();
  }

  @action
  Future cartaoAdicionar() async {
    var card = NewCard(
      cardnumber: numeroCartaoControlle.text.toString(),
      validity: validadeControlle.text.toString(),
      nome: nomeImpressoControlle.text.toString(),
      cvv: cvvControlle.text.toString(),
    );
    await cardRepository.addPaymentCard(card);
  }



}
