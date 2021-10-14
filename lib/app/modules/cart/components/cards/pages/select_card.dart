import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/cards/components/card_builder.dart';

class SelectCardDialog extends StatelessWidget {
  SelectCardDialog({Key? key}) : super(key: key);
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return AlertDialog(
      title: Column(
        children: [
          const Text(
            'Selecione o metodo de Pagamento:',
            style: TextStyle(
              fontFamily: 'Ninuto',
              fontSize: 24,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 50,
            ),
            width: screen.width * 0.5,
            height: screen.height * 0.4,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 12,
                  color: Colors.black12,
                  indent: 20,
                  endIndent: 20,
                );
              },
              itemCount: store.card.length,
              itemBuilder: (context, index) {
                final NewCard model = store.card[index];
                return CardBuilder(model: model);
              },
            ),
          )
        ],
      ),
    );
  }
}
