// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/modules/cart/pages/add_card/add_card_store.dart';

part 'form_payment_store.g.dart';

class FormPaymentStore = _FormPaymentStoreBase with _$FormPaymentStore;

abstract class _FormPaymentStoreBase with Store {
  @observable
  ObservableList<NewCard> listCard = [
    NewCard(),
  ].asObservable();

  @action
  addCard(dynamic model) {
    listCard.add(model);
  }
}
