import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:flutter/material.dart';

class CupomValueDialog extends StatefulWidget {
  const CupomValueDialog({Key? key}) : super(key: key);

  @override
  State<CupomValueDialog> createState() => _CupomValueDialogState();
}

class _CupomValueDialogState extends State<CupomValueDialog> {
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();

  final TextStyle _labelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Nunito',
  );

  late TextEditingController value;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        height: 220,
        width: 485,
        child: Center(
          child: Form(
            key: store.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor do cupom',
                  style: _labelStyle,
                ),
                TextFormField(
                  controller: value,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
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
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text(
                      'Confirmar cadastro',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      minimumSize:
                          MaterialStateProperty.all(const Size(210, 48)),
                      backgroundColor:
                          MaterialStateProperty.all(secondaryColor),
                    ),
                    onPressed: () async {
                      if (store.formKey.currentState!.validate()) {
                        store.selectCupomValue(value.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
