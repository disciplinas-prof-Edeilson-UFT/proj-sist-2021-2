import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  final _timeFormat = MaskTextInputFormatter(
      mask: '##-## min', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Telefone da loja', style: _labelStyle),
              TextFormField(
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
                  hintText: '(00)00000-0000',
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Especialidade da loja',
                      style: _labelStyle,
                    ),
                    Observer(
                      builder: (ctx) => DropdownButton<String>(
                        value: homeStore.selectedCategory,
                        style: _labelStyle,
                        icon: const Icon(Icons.expand_more),
                        iconEnabledColor: secondaryColor,
                        elevation: 2,
                        onChanged: (String? newValue) {
                          homeStore.setSelectedCategory(newValue);
                        },
                        underline: Container(
                          color: secondaryColor,
                          height: 2.0,
                        ),
                        items: homeStore.categories.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tempo de preparo médio',
                style: _labelStyle,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
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
                  hintText: '15-20 min',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Taxa de entrega',
                style: _labelStyle,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo não pode ficar vazio";
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
                  hintText: 'R\$10,00',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
