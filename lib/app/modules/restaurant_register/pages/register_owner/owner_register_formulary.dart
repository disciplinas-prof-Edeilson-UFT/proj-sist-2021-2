import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class OwnerRegisterFormulary extends StatelessWidget {
  OwnerRegisterFormulary({Key? key, required this.controller})
      : super(key: key);
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
            TextFormField(
              controller: controller['Nome'],
              textCapitalization: TextCapitalization.words,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo não pode ficar vazio";
                }
                if (value.trim().split(' ').length < 2) {
                  return "Precisa conter pelo menos dois nomes";
                }
                return null;
              },
              cursorColor: secondaryColor,
              decoration: const InputDecoration(
                focusColor: secondaryColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                  ),
                ),
                border: OutlineInputBorder(),
                hintText: 'João da Silva',
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: _labelStyle,
            ),
            TextFormField(
              controller: controller['Email'],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo não pode ficar vazio";
                }
                if (!EmailValidator.validate(value)) {
                  return "Digite um email válido";
                }
                return null;
              },
              cursorColor: secondaryColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                focusColor: secondaryColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                  ),
                ),
                border: OutlineInputBorder(),
                hintText: 'email@email.com',
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Celular (com DDD)',
              style: _labelStyle,
            ),
            TextFormField(
              controller: controller['Telefone'],
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
              cursorColor: secondaryColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                focusColor: secondaryColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                  ),
                ),
                border: OutlineInputBorder(),
                hintText: '(00) 00000-0000',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
