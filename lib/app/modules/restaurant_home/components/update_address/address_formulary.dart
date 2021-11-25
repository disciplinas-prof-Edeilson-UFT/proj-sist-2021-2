import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AdressForm extends StatelessWidget {
  const AdressForm({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.valueChangeListener,
    this.formatter,
  }) : super(key: key);

  final String hintText;
  final String label;
  final TextEditingController? controller;
  final TextInputFormatter? formatter;
  final Function? valueChangeListener;

  @override
  Widget build(BuildContext context) {
    var isDifferentField = label == 'Cidade' ||
        label == 'Estado' ||
        label == 'Bairro' ||
        label == 'Endereço';

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: fieldLabelStyle(),
          ),
          TextFormField(
            readOnly: label == 'Cidade' || label == 'Estado',
            inputFormatters: formatter != null ? [formatter!] : null,
            cursorColor: secondaryColor,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) =>
                valueChangeListener == null ? {} : valueChangeListener!(value),
            validator: (value) {
              if (value == null ||
                  value.isEmpty && label != 'Complemento (Opcional)') {
                return "Este campo não pode ficar vazio";
              }

              switch (label) {
                case 'CEP':
                  if (value.length < 9) {
                    return "Informe um CEP válido";
                  }
                  return null;
                default:
                  return null;
              }
            },
            decoration: InputDecoration(
              filled: isDifferentField,
              hintText: hintText,
              hintStyle: fieldLabelStyle(),
              border: const OutlineInputBorder(),
              focusColor: secondaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDifferentField ? Colors.black : secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressFormulary extends StatelessWidget {
  AddressFormulary({Key? key}) : super(key: key);
  final RestaurantHomeStore homeStore = Modular.get<RestaurantHomeStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...homeStore.fields.keys.map(
          (e) {
            if (e == 'CEP') {
              return AdressForm(
                label: e,
                hintText: homeStore.fields[e]?['hintText'] as String,
                controller: homeStore.addressFormController[e],
                formatter:
                    homeStore.fields[e]?['formatter'] as TextInputFormatter,
                valueChangeListener: (value) => homeStore.searchAdress(value),
              );
            }
            if (e == 'Cidade') {
              return Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: AdressForm(
                      label: e,
                      hintText: homeStore.fields[e]?['hintText'] as String,
                      controller: homeStore.addressFormController[e],
                    ),
                  ),
                  const VerticalDivider(),
                  Flexible(
                    child: AdressForm(
                      label: 'Estado',
                      hintText: 'UF',
                      controller: homeStore.addressFormController['Estado'],
                    ),
                  ),
                ],
              );
            }
            if (e == 'Estado') {
              return Container();
            }
            return AdressForm(
              formatter:
                  homeStore.fields[e]?['formatter'] as TextInputFormatter,
              label: e,
              hintText: homeStore.fields[e]?['hintText'] as String,
              controller: homeStore.addressFormController[e],
            );
          },
        ).toList(),
      ],
    );
  }
}
