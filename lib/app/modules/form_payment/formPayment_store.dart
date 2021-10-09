// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/modules/add_card/addCard_store.dart';

part 'formPayment_store.g.dart';

class FormPaymentStore = _FormPaymentStoreBase with _$FormPaymentStore;
abstract class _FormPaymentStoreBase with Store {

  @observable 
  ObservableList<AddCardStore> listCard = [
    AddCardStore(
      numero_cartao: '123456789acbdefg',
      nome_impresso: 'Fulano de tal da cunha',
      apelido: 'Cartão do Fulano',
      validade: '31/2025',
      cvv: '123',
      cpf_cnpj: '99988877766601'
    ),
    AddCardStore(
      numero_cartao: '123456789acb4567',
      nome_impresso: 'Mario henrique grabriel',
      apelido: 'Cartão clonado',
      validade: '01/2022',
      cvv: '456',
      cpf_cnpj: '12345678/0001-22'
    )
  ].asObservable();

  @action 
  addCard(AddCardStore model){
    listCard.add(model);
  }


}