import 'package:flutter/material.dart';

class RegisterField {
  static final fields = {
    'CNPJ': {
      'hintText': 'CNPJ',
      'controller': TextEditingController(),
    },
    'Razão Social': {
      'hintText': 'Razão social do seu negócio',
      'controller': TextEditingController(),
    },
    'Nome da loja': {
      'hintText': 'Nome da loja',
      'controller': TextEditingController(),
    },
    'Telefone da loja': {
      'hintText': 'Telefone da loja com DDD',
      'controller': TextEditingController(),
    },
    'CEP': {
      'hintText': 'CEP do seu negócio',
      'controller': TextEditingController(),
    },
    'Cidade': {
      'hintText': 'Cidade do seu negócio',
      'controller': TextEditingController(),
    },
    'Bairro': {
      'hintText': 'Bairro do seu negócio',
      'controller': TextEditingController(),
    },
    'Endereço': {
      'hintText': 'Logradouro do seu negócio',
      'controller': TextEditingController(),
    },
    'Número': {
      'hintText': 'Número do endereço',
      'controller': TextEditingController(),
    },
    'Complemento (Opcional)': {
      'hintText': 'Complemento do endereço',
      'controller': TextEditingController(),
    },
    'Senha': {
      'hintText': 'Senha para acesso à página da loja',
      'controller': TextEditingController(),
    },
  };
}
