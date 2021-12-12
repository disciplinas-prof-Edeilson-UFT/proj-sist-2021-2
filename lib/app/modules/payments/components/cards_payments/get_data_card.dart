import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/repositories/paymentcard/payment_card.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/paymentes_body.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class GetDataCard extends StatefulWidget {
  const GetDataCard({Key? key}) : super(key: key);

  @override
  _GetDataCardState createState() => _GetDataCardState();
}

class _GetDataCardState extends State<GetDataCard> {
  final PaymentCardRepository cardRepository = Modular.get();
  final PaymentsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      store.clearCardList();
      return FutureBuilder(
          future: cardRepository.getCards(),
          builder: (BuildContext context,
              AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Erro');
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<NewCard> listCards = [];
              for (var i = 0; i < snapshot.data!.length; i++) {
                var nome = snapshot.data!.elementAt(i).get('name');
                var cardnumber = snapshot.data!.elementAt(i).get('cardnumber');
                var validity = snapshot.data!.elementAt(i).get('validade');
                var cvv = snapshot.data!.elementAt(i).get('cvv');
                var cpf = snapshot.data!.elementAt(i).get('cpf');
                NewCard card = NewCard(
                  cardnumber: cardnumber,
                  validity: validity,
                  nome: nome,
                  cvv: cvv,
                  cpf: cpf,
                );
                if (!store.cards.contains(card)) {
                  listCards.add(card);
                  store.addCardList(card);
                } else {
                  print('object');
                }
              }
              return PaymentsBody(listCards: listCards);
            }
            return const Center(
                child: CircularProgressIndicator(
              color: secondaryColor,
            ));
          });
    });
  }
}
