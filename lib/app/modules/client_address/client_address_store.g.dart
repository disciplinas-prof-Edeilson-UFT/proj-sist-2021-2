// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientAddressStore on _ClientAddressStoreBase, Store {
  Computed<bool>? _$semNumComputed;

  @override
  bool get semNum => (_$semNumComputed ??= Computed<bool>(() => super.semNum,
          name: '_ClientAddressStoreBase.semNum'))
      .value;

  final _$addressTypeAtom = Atom(name: '_ClientAddressStoreBase.addressType');

  @override
  FilterAddressType get addressType {
    _$addressTypeAtom.reportRead();
    return super.addressType;
  }

  @override
  set addressType(FilterAddressType value) {
    _$addressTypeAtom.reportWrite(value, super.addressType, () {
      super.addressType = value;
    });
  }

  final _$filterAtom = Atom(name: '_ClientAddressStoreBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

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

  final _$filtListAddressAtom =
      Atom(name: '_ClientAddressStoreBase.filtListAddress');

  @override
  ObservableList<DeliveryAt> get filtListAddress {
    _$filtListAddressAtom.reportRead();
    return super.filtListAddress;
  }

  @override
  set filtListAddress(ObservableList<DeliveryAt> value) {
    _$filtListAddressAtom.reportWrite(value, super.filtListAddress, () {
      super.filtListAddress = value;
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

  final _$numberAtom = Atom(name: '_ClientAddressStoreBase.number');

  @override
  String? get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String? value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
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

  final _$_semAtom = Atom(name: '_ClientAddressStoreBase._sem');

  @override
  bool get _sem {
    _$_semAtom.reportRead();
    return super._sem;
  }

  @override
  set _sem(bool value) {
    _$_semAtom.reportWrite(value, super._sem, () {
      super._sem = value;
    });
  }

  final _$deleteItAtom = Atom(name: '_ClientAddressStoreBase.deleteIt');

  @override
  bool get deleteIt {
    _$deleteItAtom.reportRead();
    return super.deleteIt;
  }

  @override
  set deleteIt(bool value) {
    _$deleteItAtom.reportWrite(value, super.deleteIt, () {
      super.deleteIt = value;
    });
  }

  final _$isEditingAtom = Atom(name: '_ClientAddressStoreBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$createOrUpdateAsyncAction =
      AsyncAction('_ClientAddressStoreBase.createOrUpdate');

  @override
  Future createOrUpdate({DeliveryAt? address}) {
    return _$createOrUpdateAsyncAction
        .run(() => super.createOrUpdate(address: address));
  }

  final _$deleteAddressAsyncAction =
      AsyncAction('_ClientAddressStoreBase.deleteAddress');

  @override
  Future deleteAddress({required String uid}) {
    return _$deleteAddressAsyncAction.run(() => super.deleteAddress(uid: uid));
  }

  final _$findAdressAsyncAction =
      AsyncAction('_ClientAddressStoreBase.findAdress');

  @override
  Future findAdress() {
    return _$findAdressAsyncAction.run(() => super.findAdress());
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

  final _$_ClientAddressStoreBaseActionController =
      ActionController(name: '_ClientAddressStoreBase');

  @override
  dynamic checkSem() {
    final _$actionInfo = _$_ClientAddressStoreBaseActionController.startAction(
        name: '_ClientAddressStoreBase.checkSem');
    try {
      return super.checkSem();
    } finally {
      _$_ClientAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectAddressType(FilterAddressType value) {
    final _$actionInfo = _$_ClientAddressStoreBaseActionController.startAction(
        name: '_ClientAddressStoreBase.selectAddressType');
    try {
      return super.selectAddressType(value);
    } finally {
      _$_ClientAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic disposePick() {
    final _$actionInfo = _$_ClientAddressStoreBaseActionController.startAction(
        name: '_ClientAddressStoreBase.disposePick');
    try {
      return super.disposePick();
    } finally {
      _$_ClientAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addressType: ${addressType},
filter: ${filter},
addresses: ${addresses},
filtListAddress: ${filtListAddress},
tempAddress: ${tempAddress},
number: ${number},
errorMessage: ${errorMessage},
deleteIt: ${deleteIt},
isEditing: ${isEditing},
semNum: ${semNum}
    ''';
  }
}
