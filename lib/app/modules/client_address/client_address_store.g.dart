// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientAddressStore on _ClientAddressStoreBase, Store {
  final _$addressesAtom = Atom(name: '_ClientAddressStoreBase.addresses');

  @override
  AppResponse<ObservableList<DeliveryAt>> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(AppResponse<ObservableList<DeliveryAt>> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  final _$tempAddressAtom = Atom(name: '_ClientAddressStoreBase.tempAddress');

  @override
  AppResponse<DeliveryAt> get tempAddress {
    _$tempAddressAtom.reportRead();
    return super.tempAddress;
  }

  @override
  set tempAddress(AppResponse<DeliveryAt> value) {
    _$tempAddressAtom.reportWrite(value, super.tempAddress, () {
      super.tempAddress = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ClientAddressStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$updateAddressAsyncAction =
      AsyncAction('_ClientAddressStoreBase.updateAddress');

  @override
  Future createOrUpdate({DeliveryAt? address}) {
    return _$updateAddressAsyncAction
        .run(() => super.createOrUpdate(address: address));
  }

  final _$deleteAddressAsyncAction =
      AsyncAction('_ClientAddressStoreBase.deleteAddress');

  @override
  Future deleteAddress({required String uid}) {
    return _$deleteAddressAsyncAction.run(() => super.deleteAddress(uid: uid));
  }

  final _$fetchSavedAddressesAsyncAction =
      AsyncAction('_ClientAddressStoreBase.fetchSavedAddresses');

  @override
  Future fetchSavedAddresses() {
    return _$fetchSavedAddressesAsyncAction
        .run(() => super.fetchSavedAddresses());
  }

  final _$findCEPAsyncAction = AsyncAction('_ClientAddressStoreBase.findCEP');

  @override
  Future findCEP() {
    return _$findCEPAsyncAction.run(() => super.findCEP());
  }

  @override
  String toString() {
    return '''
addresses: ${addresses},
tempAddress: ${tempAddress},
errorMessage: ${errorMessage}
    ''';
  }
}
