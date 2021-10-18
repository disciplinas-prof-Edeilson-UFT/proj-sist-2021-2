import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/modules/register/restaurant/store/models/form_error_store.dart';
import 'package:pscomidas/app/modules/register/restaurant/store/models/register_store.dart';

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

  final RegisterStore _registerStore = RegisterStore();
  final FormErrorState _formErrorState = FormErrorState();

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
                onChanged: _registerStore.setName,
                controller: controller['name'],
                textCapitalization: TextCapitalization.words,
                validator: (_) {
                  _formErrorState.validateName;
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
                onChanged: _registerStore.setEmail,
                controller: controller['email'],
                validator: (_) {
                  _formErrorState.validateEmail;
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
                onChanged: _registerStore.setPhone,
                controller: controller['phone'],
                inputFormatters: [_phoneFormat],
                validator: (_) {
                  _formErrorState.validatePhone;
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
