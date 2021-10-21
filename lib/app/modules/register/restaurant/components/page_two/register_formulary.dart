import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/field_label_style.dart';
import 'package:search_cep/search_cep.dart';

class RegisterFormulary extends StatelessWidget {
  const RegisterFormulary({
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
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: fieldLabelStyle(),
          ),
          TextFormField(
            readOnly: isDifferentField,
            inputFormatters: formatter != null ? [formatter!] : null,
            cursorColor: secondaryCollor,
            controller: controller,
            onChanged: (value) =>
                valueChangeListener == null ? {} : valueChangeListener!(value),
            validator: (value) {
              if (value == null ||
                  value.isEmpty && label != 'Complemento (Opcional)') {
                return "Este campo não pode ficar vazio";
              }

              switch (label) {
                case 'Senha':
                  if (value.length < 6) {
                    return "Senha muito curta.";
                  }
                  return null;

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

                default:
                  return null;
              }
            },
            obscureText: label == 'Senha',
            decoration: InputDecoration(
              filled: isDifferentField,
              hintText: hintText,
              hintStyle: fieldLabelStyle(),
              helperText: label == 'Nome da loja'
                  ? 'Esse é o nome que aparecerá no aplicativo'
                  : null,
              border: const OutlineInputBorder(),
              focusColor: secondaryCollor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDifferentField ? Colors.black : secondaryCollor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
