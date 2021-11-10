import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

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

  final _moneyFormat =
      MaskTextInputFormatter(mask: '##.##', filter: {"#": RegExp(r'[0-9]')});

  Map<String, TextEditingController> controller = {
    'Tempo de preparo': TextEditingController(),
    'Taxa de entrega': TextEditingController(),
    'telefone': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 10.0, left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Telefone da loja', style: _labelStyle),
              TextFormField(
                controller: controller['telefone'],
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
                'Tempo de preparo médio',
                style: _labelStyle,
              ),
              TextFormField(
                controller: controller['Tempo de preparo'],
                inputFormatters: [_timeFormat],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  return null;
                },
                cursorColor: secondaryColor,
                decoration: const InputDecoration(
                  suffixText: 'minutos',
                  focusColor: secondaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: secondaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  hintText: '00-00',
                ),
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
                onChanged: (e) {
                  print(controller['Taxa de entrega']!.text);
                },
                controller: controller['Taxa de entrega'],
                inputFormatters: [_moneyFormat],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
                  }
                  return null;
                },
                cursorColor: secondaryColor,
                decoration: const InputDecoration(
                  suffixText: 'Reais',
                  hintText: 'R\$ 10.00',
                  focusColor: secondaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: secondaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
