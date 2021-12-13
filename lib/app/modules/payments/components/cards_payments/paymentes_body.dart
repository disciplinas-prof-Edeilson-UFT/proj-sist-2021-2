import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/add_card/add_body.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/empty_card.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/list_card.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class PaymentsBody extends StatefulWidget {
  const PaymentsBody({Key? key, required this.listCards}) : super(key: key);
  final List<NewCard> listCards;

  @override
  _PaymentsBodyState createState() => _PaymentsBodyState();
}

class _PaymentsBodyState extends State<PaymentsBody> {
  final PaymentsStore store = Modular.get();
  double _sizeHeight(int tamanho) {
    switch (tamanho) {
      case 0: 
        return 0.25;
      case 1:
        return 0.15;
      case 2:
        return 0.29;
      case 3:
        return 0.43;
      case 4:
        return 0.57;
      default:
        return 0.57;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            const Text(
              'Formas de pagamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return SizedBox(
                  width: screen.width <= 1030
                      ? screen.width * 0.8
                      : screen.width * 0.5,
                  height: screen.height * _sizeHeight(store.cards.length),
                  child: Observer(builder: (_) {
                    return store.cards.isEmpty 
                    ? const EmptyCard()  
                    : ListViewCard(listCards: widget.listCards);
                  }));
            }),
            SizedBox(
              height: screen.height * 0.02,
            ),
            Observer(builder: (_) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                    fixedSize: const Size(300, 50),
                  ),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              screen.width <= 1030
                                  ? const AddCard()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: screen.width <= 1030
                                                ? screen.width * 0.3
                                                : screen.width * 0.5,
                                            height: 500,
                                            child: Image.asset(
                                              'lib/app/modules/payments/assets/images/add_card.png',
                                              fit: BoxFit.cover,
                                            )),
                                        const AddCard()
                                      ],
                                    )
                            ],
                          )),
                  child: const Text('Adicionar forma de pagamento'));
            }),
          ],
        ),
      ),
    ));
  }
}
