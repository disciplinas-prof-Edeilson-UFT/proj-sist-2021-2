import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';

class ShopRegisterFormulary extends StatelessWidget {
  ShopRegisterFormulary({
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
  final RestaurantRegisterStore registerStore =
      Modular.get<RestaurantRegisterStore>();

  @override
  Widget build(BuildContext context) {
    var isDifferentField = label == 'Cidade' ||
        label == 'Estado' ||
        label == 'Bairro' ||
        label == 'Endereço';

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: fieldLabelStyle(),
          ),
          TextFormField(
            // Caso o CEP retorne apenas a cidade e o estado, como em 77500-000,
            // os campos bairro e endereço tornam-se editáveis
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
                case 'Senha':
                case 'Confirmar Senha':
                  if (value.length < 6) {
                    return "Senha muito curta.";
                  }
                  return registerStore.validatePassword();

                case 'CNPJ':
                  if (!CNPJValidator.isValid(value)) {
                    // Exemplo de cnpj válido -> 12.175.094/0001-19
                    return "Informe um CNPJ válido";
                  }
                  return null;

                case 'CEP':
                  if (value.length < 9) {
                    return "Informe um CEP válido";
                  }
                  return null;

                case 'Telefone da loja':
                  if (value.length <= 14) {
                    return "Digite um número de telefone válido";
                  }
                  return null;

                default:
                  return null;
              }
            },
            obscureText: label == 'Senha' || label == 'Confirmar Senha',
            decoration: InputDecoration(
              filled: isDifferentField,
              hintText: hintText,
              hintStyle: fieldLabelStyle(),
              helperText: label == 'Nome da loja'
                  ? 'Esse é o nome que aparecerá no aplicativo'
                  : null,
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
