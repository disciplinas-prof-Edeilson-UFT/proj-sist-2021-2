import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterField {
  static final fields = {
    'CNPJ': {
      'hintText': 'CNPJ',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(
        mask: '##.###.###/####-##',
        filter: {"#": RegExp(r'[0-9]')},
      ),
    },
    'Razão Social': {
      'hintText': 'Razão social do seu negócio',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Nome da loja': {
      'hintText': 'Nome da loja',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Telefone da loja': {
      'hintText': 'Telefone da loja com DDD',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(
        mask: '(##) #####-####',
        filter: {"#": RegExp(r'[0-9]')},
      ),
    },
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
    'Senha': {
      'hintText': 'Senha para acesso à página da loja',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
    'Confirmar Senha': {
      'hintText': 'Digite a senha novamente',
      'controller': TextEditingController(),
      'formatter': MaskTextInputFormatter(),
    },
  };
}
