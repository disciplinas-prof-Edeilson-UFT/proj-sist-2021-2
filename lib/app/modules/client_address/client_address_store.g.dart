// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientAddressStore on _ClientAddressStoreBase, Store {
  final _$addressesAtom = Atom(name: '_ClientAddressStoreBase.addresses');

  @override
  ObservableList<DeliveryAt> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(ObservableList<DeliveryAt> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  final _$tempAddressAtom = Atom(name: '_ClientAddressStoreBase.tempAddress');

  @override
  DeliveryAt? get tempAddress {
    _$tempAddressAtom.reportRead();
    return super.tempAddress;
  }

  @override
  set tempAddress(DeliveryAt? value) {
    _$tempAddressAtom.reportWrite(value, super.tempAddress, () {
      super.tempAddress = value;
    });
  }

  @override
  String toString() {
    return '''
addresses: ${addresses},
tempAddress: ${tempAddress}
    ''';
  }
}
