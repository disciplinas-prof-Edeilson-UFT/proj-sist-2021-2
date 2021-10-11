// ignore_for_file: file_names

import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';

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
