// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
part 'add_card_store.g.dart';

class AddCardStore = _AddCardStoreBase with _$AddCardStore;

abstract class _AddCardStoreBase with Store {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController holder = TextEditingController();
  TextEditingController valid = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController nickname = TextEditingController();

  void addCard() {
    NewCard newCard = NewCard(
      fourLastNumbers: cardNumber.text.split('.').last,
      brand: '',
      holder: holder.text,
      valid: valid.text,
      cpf: cpf.text,
      nickname: nickname.text,
    );
  }
}
