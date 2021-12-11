import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/repositories/client_address/client_address_repository.dart';
import 'package:pscomidas/app/global/utils/app_response.dart';

part 'client_address_store.g.dart';

class ClientAddressStore = _ClientAddressStoreBase with _$ClientAddressStore;

abstract class _ClientAddressStoreBase with Store {
  final _repository = ClientAddressRepository();
  final pageController = PageController(initialPage: 0);

  final textController = TextEditingController();
  final cepController = TextEditingController();

  @observable
  AppResponse<ObservableList<DeliveryAt>> addresses =
      AppResponse<ObservableList<DeliveryAt>>();

  @observable
  AppResponse<DeliveryAt> tempAddress = AppResponse<DeliveryAt>();

  @observable
  String? errorMessage;

  @observable
  bool isEditing = false;

  void jump(int page) {
    pageController.jumpToPage(page);
  }

  @action
  createOrUpdate({DeliveryAt? address}) async {
    try {
      if (address != null) {
        await _repository.updateAddress(address);
      } else {
        await _repository.createAddress(tempAddress.body!);
      }
      jump(0);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  deleteAddress({required String uid}) async {
    try {
      List<String> clientAddresses = [];
      for (var element in addresses.body!) {
        if (element.id! != uid) {
          clientAddresses.add(element.id!);
        }
      }
      await _repository.removeAddress(uid, clientAddresses);
      addresses.body!.removeWhere((element) => element.id == uid);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  setDeliveryAt(String uid) async {
    try {
      await _repository.updateCurrentAddress(uid);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  fetchSavedAddresses() async {
    addresses = AppResponse.loading();
    try {
      final response = await _repository.fetchAddresses();
      addresses = AppResponse.completed(response.asObservable());
    } catch (e) {
      errorMessage = e.toString();
      addresses = AppResponse.error(errorMessage);
    }
  }

  @action
  findCEP() async {
    tempAddress = AppResponse.loading();
    try {
      final response = await _repository.findCEP(cepController.text);
      tempAddress = AppResponse.completed(response);
    } on Exception catch (e) {
      errorMessage = e.toString();
      tempAddress = AppResponse.error(errorMessage);
    }
  }

  @action
  disposePick() {
    cepController.clear();
    tempAddress.body = null;
  }
}
