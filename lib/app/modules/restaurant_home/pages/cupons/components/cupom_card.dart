import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

import 'cupom_selector.dart';

class CupomCard extends StatelessWidget {
  final String name;
  final String text;
  final String image;
  final String descr;
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final TextEditingController controller = TextEditingController();

  CupomCard(
      {Key? keys,
      required this.name,
      required this.text,
      required this.image,
      required this.descr})
      : super(key: keys);

  @override
  Widget build(BuildContext context) {
    return CupomSelector(
      cupom: Card(
        color: Colors.white,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffEFF3F5),
            ),
            height: 300,
            width: 250,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: name == 'nenhum'
                          ? const EdgeInsets.only(top: 15, bottom: 5)
                          : const EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.asset(
                        image,
                        height: 50,
                        color: const Color(0xFF2e6788),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Color(0xFF2e6788),
                        fontSize: 18,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          child: Text(
                            descr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child:
                        name == 'desconto' ? valueField() : const SizedBox()),
              ],
            ),
          ),
        ),
      ),
      cardName: name,
    );
  }

  Widget valueField() {
    return Center(
      child: Form(
        key: store.formKey,
        child: Column(
          children: [
            const Text(
              'Valor do cupom',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Nunito',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: controller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                  CurrencyTextInputFormatter(decimalDigits: 0, symbol: 'R\$')
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O cupom deve ter um valor!";
                  }
                  return null;
                },
                cursorColor: secondaryColor,
                decoration: const InputDecoration(
                  hintText: 'R\$ 10',
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
            ),
          ],
        ),
      ),
    );
  }
}
