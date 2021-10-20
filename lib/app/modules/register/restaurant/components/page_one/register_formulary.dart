import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulary extends StatelessWidget {
  Formulary({Key? key, required this.controller}) : super(key: key);
  final Map controller;

  final TextStyle _labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
  );
  final _phoneFormat = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome completo', style: _labelStyle),
            Observer(builder: (_) {
              return TextFormField(
                controller: controller['name'],
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  if (value.trim().split(' ').length < 2) {
                    return "Precisa conter pelo menos dois nomes";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'João da Silva',
                ),
              );
            }),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: _labelStyle,
            ),
            Observer(builder: (_) {
              return TextFormField(
                controller: controller['email'],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  if (!value.contains('@') || !value.contains('.com')) {
                    return "Digite um email válido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'email@email.com',
                ),
              );
            }),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Celular (com DDD)',
              style: _labelStyle,
            ),
            Observer(builder: (_) {
              return TextFormField(
                controller: controller['phone'],
                inputFormatters: [_phoneFormat],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  if (value.length <= 14) {
                    return "Digite um número de telefone válido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '(00) 00000-0000',
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
