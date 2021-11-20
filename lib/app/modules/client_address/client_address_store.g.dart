// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientAddressStore on _ClientAddressStoreBase, Store {
  final _$textControllerAtom =
      Atom(name: '_ClientAddressStoreBase.textController');

  @override
  TextEditingController get textController {
    _$textControllerAtom.reportRead();
    return super.textController;
  }

  @override
  set textController(TextEditingController value) {
    _$textControllerAtom.reportWrite(value, super.textController, () {
      super.textController = value;
    });
  }

  @override
  String toString() {
    return '''
textController: ${textController}
    ''';
  }
}
