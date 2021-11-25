import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/repositories/client_address/client_address_repository.dart';

part 'client_address_store.g.dart';

class ClientAddressStore = _ClientAddressStoreBase with _$ClientAddressStore;

abstract class _ClientAddressStoreBase with Store {
  final _repository = ClientAddressRepository();
  final pageController = PageController(initialPage: 0);

  final textController = TextEditingController();
  final cepController = TextEditingController();

  @observable
  ObservableList<DeliveryAt> addresses = ObservableList<DeliveryAt>();

  @observable
  DeliveryAt? tempAddress;

  @observable
  String? errorMessage;

  void jump(int page) {
    pageController.jumpToPage(page);
  }

  @action
  Future<void> findCEP() async {
    tempAddress = null;
    try {
      tempAddress = await _repository.findCEP(cepController.text);
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
  }
}
