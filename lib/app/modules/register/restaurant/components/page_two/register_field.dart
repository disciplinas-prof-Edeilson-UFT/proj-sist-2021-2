import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register/restaurant/components/page_two/field_label_style.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final String label;
  final TextEditingController? controller;

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
            cursorColor: secondaryCollor,
            controller: controller,
            validator: (value) {
              if (value!.isEmpty || label != 'Complemento (Opcional)') {
                return "Este campo não pode ficar vazio";
              }
              if (value.isEmpty || value.length < 6 && label == 'Senha') {
                return 'Senha muito curta.';
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
