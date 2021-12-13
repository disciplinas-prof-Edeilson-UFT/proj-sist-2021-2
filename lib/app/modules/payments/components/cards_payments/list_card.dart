import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/btn_edit.dart';
import 'package:pscomidas/app/modules/payments/components/cards_payments/btn_excluir.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class ListViewCard extends StatefulWidget {
  const ListViewCard({Key? key, required this.listCards}) : super(key: key);
  final List<NewCard> listCards;

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  final PaymentsStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    // Função para pegar apenas os quatros ultimos numeros do cartão
    String getLastChars(String numero) {
      numero = numero.replaceAll(' ', '');
      var tamanho = numero.length;
      var start = tamanho == 16 ? 12 : 10;
      var end = tamanho;
      var lastChars = numero.substring(start, end);
      return lastChars;
    }
    final Size screen = MediaQuery.of(context).size;
    return ListView.builder(
    itemCount: store.cards.length, // numero de cartões cadastrados
    itemBuilder: (_, index) {
      return SizedBox(
        height: 100,
        child: Card(
            child: InkWell(
          splashColor: Colors.red.withAlpha(30),
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.credit_card,
                      color: secondaryColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: screen.width * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.cards.elementAt(index).nome,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '... ${getLastChars(store.cards.elementAt(index).cardnumber)}',
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [BtnEdit(), BtnExcluir()],
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}