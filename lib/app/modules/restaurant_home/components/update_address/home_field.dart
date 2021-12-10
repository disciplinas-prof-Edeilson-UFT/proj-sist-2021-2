import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeField {
  static final fields = {
    'CEP': {
      'hintText': 'CEP do seu negócio',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(
        mask: '#####-###',
        filter: {"#": RegExp(r'[0-9]')},
      ),
    },
    'Cidade': {
      'hintText': 'Cidade do seu negócio',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Estado': {
      'hintText': 'UF',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Bairro': {
      'hintText': 'Bairro do seu negócio',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Endereço': {
      'hintText': 'Logradouro do seu negócio',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Número': {
      'hintText': 'Número do endereço',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(
        mask: '#####',
        filter: {"#": RegExp(r'[0-9]')},
      ),
    },
    'Complemento (Opcional)': {
      'hintText': 'Complemento do endereço',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
  };
}
