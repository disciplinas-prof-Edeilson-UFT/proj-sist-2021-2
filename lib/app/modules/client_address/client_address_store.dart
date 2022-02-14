import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pscomidas/app/global/models/entities/delivery_at.dart';
import 'package:pscomidas/app/global/models/enums/address_type.dart';
import 'package:pscomidas/app/global/repositories/client_address/client_address_repository.dart';
import 'package:pscomidas/app/global/utils/app_response.dart';

part 'client_address_store.g.dart';

class ClientAddressStore = _ClientAddressStoreBase with _$ClientAddressStore;

abstract class _ClientAddressStoreBase with Store {
  final _repository = ClientAddressRepository();
  final pageController = PageController(initialPage: 0);
  final textController = TextEditingController();
  final cepController = TextEditingController();

  List<FilterAddressType> addTypes = [
    FilterAddressType.casa,
    FilterAddressType.trabalho,
    FilterAddressType.outro,
  ];

  @observable
  FilterAddressType addressType = FilterAddressType.casa;

  @observable
  String currentAddress = "Endereço não encontrado";

  @observable
  String filter = "";

  @observable
  AppResponse<ObservableList<DeliveryAt>> addresses =
      AppResponse<ObservableList<DeliveryAt>>();

  @observable
  ObservableList<DeliveryAt> filteredAddress = ObservableList<DeliveryAt>();

  @observable
  AppResponse<DeliveryAt> tempAddress = AppResponse<DeliveryAt>();

  @observable
  String? number;

  @observable
  String? errorMessage;

  @observable
  bool _sem = false;

  @computed
  bool get semNum => _sem;

  @action
  checkSem() => _sem = !_sem;

  @observable
  bool deleteIt = false;

  @observable
  bool isEditing = false;

  void jump(int page) {
    pageController.jumpToPage(page);
  }

  @action
  selectAddressType(FilterAddressType value) => addressType = value;

  @action
  createOrUpdate(BuildContext context) async {
    try {
      tempAddress.body!.addressType = addressType;
      if (isEditing == true) {
        await _repository.updateAddress(tempAddress.body!);
        await fetchSavedAddresses();
        Navigator.pop(context);
      } else {
        if (semNum) {
          number = '';
        }
        tempAddress.body!.number = number;
        if (tempAddress.body!.number == null) {
          jump(3);
        } else {
          await _repository.createAddress(tempAddress.body!);
          Navigator.pop(context);
        }
      }
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
      await fetchSavedAddresses();
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
  findAdress() async {
    filteredAddress.clear();
    if (filter.isEmpty && addresses.body != null) {
      filteredAddress.addAll(addresses.body!);
    } else {
      List<String> vadress = [];
      for (var address in addresses.body!) {
        vadress.add(address.cep);
        vadress.add(address.addressType.toString());
        address.street!.toLowerCase().split(' ').forEach((element) {
          if (!vadress.contains(element)) {
            vadress.add(element);
          }
        });
        address.city.toLowerCase().split(' ').forEach((element) {
          if (!vadress.contains(element)) {
            vadress.add(element);
          }
        });
        address.complement!.toLowerCase().split(' ').forEach((element) {
          if (!vadress.contains(element)) {
            vadress.add(element);
          }
        });
        for (var words in vadress) {
          if (words.startsWith(filter.toLowerCase())) {
            if (!filteredAddress.contains(address)) {
              filteredAddress.add(address);
            } else {
              break;
            }
          }
        }
        vadress.clear();
      }
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
  updateDeliveryAt(DeliveryAt address) async {
    try {
      await _repository.updateDeliveryAt(address.id!);
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  @action
  findCEP() async {
    String? id = tempAddress.body == null ? null : tempAddress.body!.id;
    tempAddress = AppResponse.loading();
    try {
      final response = await _repository.findCEP(cepController.text, id);
      tempAddress = AppResponse.completed(response);
    } on Exception catch (e) {
      errorMessage = e.toString();
      tempAddress = AppResponse.error(errorMessage);
    }
  }

  @action
  disposePick() {
    cepController.clear();
  }
}
