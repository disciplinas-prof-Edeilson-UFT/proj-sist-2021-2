// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_error_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_FormErrorState.isValid'))
      .value;

  final _$_FormErrorStateActionController =
      ActionController(name: '_FormErrorState');

  @override
  String? validateName() {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.validateName');
    try {
      return super.validateName();
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePhone() {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.validatePhone');
    try {
      return super.validatePhone();
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail() {
    final _$actionInfo = _$_FormErrorStateActionController.startAction(
        name: '_FormErrorState.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_FormErrorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValid: ${isValid}
    ''';
  }
}
