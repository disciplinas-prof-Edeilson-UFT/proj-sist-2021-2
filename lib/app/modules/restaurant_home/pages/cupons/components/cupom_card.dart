import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/cupons/components/cupom_selector.dart';

class CupomCard extends StatelessWidget {
  final String name;
  final String text;
  final String image;
  final String descr;
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();

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
              color: cupomColor,
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
                        color: cupomTextColor,
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
                        color: cupomTextColor,
                        fontSize: 18,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
                name == 'desconto'
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    descr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: valueField(),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  descr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valor do cupom',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Nunito',
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  onChanged: (value) => store.cupomButtonResolver(),
                  textAlign: TextAlign.center,
                  controller: store.valueController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                    CurrencyTextInputFormatter(decimalDigits: 0, symbol: 'R\$')
                  ],
                  onTap: () => {
                    store.setSelectedCupom('desconto'),
                    store.actualCupom!['tipo'] == 'desconto'
                        ? store.valueController.text =
                            'R\$' + store.actualCupom!['valor'].toString()
                        : store.valueController.text = '',
                    store.cupomButtonResolver(),
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "O cupom deve ter um valor válido!";
                    } else {
                      final valor =
                          int.parse(value.replaceAll(RegExp('[^0-9]'), ''));
                      if (valor == 0) {
                        return "O cupom deve ter um valor válido!";
                      }
                    }
                    return null;
                  },
                  cursorColor: secondaryColor,
                  decoration: const InputDecoration(
                    hintText: 'R\$10',
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
            ),
          ],
        ),
      ),
    );
  }
}
