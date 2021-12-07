import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class CupomSelector extends StatelessWidget {
  CupomSelector({Key? key, required this.cardName, required this.cupom})
      : super(key: key);
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final String cardName;
  final Card cupom;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return InkWell(
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        onTap: () => {
          store.setSelectedCupom(cardName),
          if (store.actualCupom?['tipo'] == 'desconto')
            {
              store.valueController.text =
                  'R\$' + store.actualCupom!['valor'].toString(),
            }
          else
            {
              store.formKey.currentState?.reset(),
            },
          if (cardName == 'desconto')
            {
              store.cupomButtonResolver(),
            }
          else
            {
              store.setSelectedCupomValue(null),
              store.formKey.currentState?.reset(),
            }
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (store.actualCupom?['tipo'] == cardName)
              if (store.actualCupom?['tipo'] == null ||
                  store.selectedCupom?['tipo'] == cardName)
                showInfo('Este é o seu cupom atual', activated: true)
              else
                showInfo('Este é o seu cupom atual', activated: false)
            else if (store.actualCupom?['tipo'] != cardName &&
                store.selectedCupom?['tipo'] == cardName)
              if (cardName == 'nenhum')
                showInfo('Remover o cupom ativo', activated: true)
              else if (cardName == 'entrega_gratis')
                showInfo('Adicionar o cupom de entrega grátis', activated: true)
              else
                showInfo('Adicionar o cupom de ${cardName.toLowerCase()}',
                    activated: true)
            else
              showInfo('Clique para alterar o cupom', activated: false),
            SizedBox(
              height: 300,
              width: 250,
              child: cupom,
            ),
          ],
        ),
      );
    });
  }

  Widget showInfo(String message, {required bool activated}) {
    Color color = activated ? secondaryColor : tertiaryColor;
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
      ),
      height: 324,
      width: 260,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          message,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontFamily: 'Nunito'),
        ),
      ),
    );
  }
}
