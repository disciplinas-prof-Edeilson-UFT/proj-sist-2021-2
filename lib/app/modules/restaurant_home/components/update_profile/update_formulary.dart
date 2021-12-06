import 'package:another_flushbar/flushbar_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/global/repositories/restaurant_home/profile/profile_repository.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/components_profile_dialog.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/update_profile/update_profile_dropdown.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class UpdateFormulary extends StatelessWidget {
  UpdateFormulary({Key? key}) : super(key: key);

  final RestaurantHomeStore homeStore = Modular.get<RestaurantHomeStore>();

  final TextStyle _labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
  );
  final _phoneFormat = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  final _timeFormat =
      MaskTextInputFormatter(mask: '##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Telefone da loja', style: _labelStyle),
                TextFormField(
                  controller:
                      homeStore.profileFormController['phoneRestaurant'],
                  inputFormatters: [_phoneFormat],
                  textCapitalization: TextCapitalization.words,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),
        ),
        const UpdateProfileDropdown(),
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tempo de preparo médio',
                style: _labelStyle,
              ),
              TextFormField(
                controller: homeStore.profileFormController['prepareTime'],
                inputFormatters: [_timeFormat],
                validator: (value) {
                  var values = value?.split('-');
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  if (value.length < 5) {
                    return "Campo incompleto";
                  }
                  if (num.parse(values![0]) >= num.parse(values[1])) {
                    return "Intervalo de tempo inválido";
                  }
                  return null;
                },
                cursorColor: secondaryColor,
                decoration: const InputDecoration(
                  suffixText: 'min',
                  focusColor: secondaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: secondaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  hintText: '00-00',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Taxa de entrega',
                style: _labelStyle,
              ),
              TextFormField(
                controller: homeStore.profileFormController['deliveryPrice'],
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                  CurrencyTextInputFormatter(decimalDigits: 2, symbol: 'R\$')
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  return null;
                },
                cursorColor: secondaryColor,
                decoration: const InputDecoration(
                  hintText: 'R\$ 10.00',
                  focusColor: secondaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: secondaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
          child: ConfirmationButton(
            onPressed: () async {
              await ProfileRepository()
                  .setProfileRestaurant(homeStore.restaurant!);
              homeStore.getRestaurant();
              Navigator.of(context).pop();
              await showConfirmationFlush(context);
            },
          ),
        ),
      ],
    );
  }
}
