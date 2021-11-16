import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentsStore store = Modular.get();
    return Container(
      color: primaryCollor,
      width: 300,
      height: 450,
      child: Column(
        children: [
          const Text(
            'Selecione o tipo de cartão',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold),
          ),
          const SizedBox( height: 50,),
          SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(builder: (_) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: primaryCollor,
                          fixedSize: const Size(200, 50)),
                      onPressed: () {
                        store.setType('Débito');
                        store.setTypeCardChosen(true);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.credit_card,
                            color: tertiaryColor,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Débito',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ));
                }),
                const SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primaryCollor, fixedSize: const Size(200, 50)),
                    onPressed: () {
                      store.setType('Crédito');
                        store.setTypeCardChosen(true);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.credit_card, color: tertiaryColor),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Crédito',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
