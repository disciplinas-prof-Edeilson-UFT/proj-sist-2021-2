import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/field_label_style.dart';

class RegisterFormulary extends StatelessWidget {
  const RegisterFormulary({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.formatter,
  }) : super(key: key);

  final String hintText;
  final String label;
  final TextEditingController? controller;
  final TextInputFormatter? formatter;

  @override
  Widget build(BuildContext context) {
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
            inputFormatters: formatter != null ? [formatter!] : null,
            cursorColor: secondaryCollor,
            controller: controller,
            validator: (value) {

              if (value == null ||value.isEmpty && label != 'Complemento (Opcional)') {
                return "Este campo não pode ficar vazio";
              }
              // PROPOSIÇÃO DE IMPLEMENTAÇÃO DE VALIDAÇÃO UTILIZANDO SWITCH CASE.
              // em caso de recusa, recomendo resetar o repositório ao commit anterior.
              switch (label) {
                case 'Complemento (Opcional)':
                  return null;

                case 'Senha':
                  if (value.length < 6) {
                    return "Senha muito curta.";
                  }
                  return null;
                
                case 'CNPJ':
                  if (!CNPJValidator.isValid(value)) {//Exemplo de cnpj válido -> 12.175.094/0001-19
                    return "Informe um CNPJ válido";
                  }
                  return null;

                default:
                  return null;

              }
            },
            obscureText: label == 'Senha',
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: fieldLabelStyle(),
              helperText: label == 'Nome da loja'
                  ? 'Esse é o nome que aparecerá no aplicativo'
                  : null,
              border: const OutlineInputBorder(),
              focusColor: secondaryCollor,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryCollor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
