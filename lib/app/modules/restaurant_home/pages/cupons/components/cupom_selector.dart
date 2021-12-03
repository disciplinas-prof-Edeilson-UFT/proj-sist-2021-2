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
        onTap: () => store.selectCupomName(cardName),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (store.actualCupom?['tipo'] == cardName)
              if (store.selectedCupom?['tipo'] == null ||
                  store.selectedCupom?['tipo'] == cardName)
                showInfo('Este é o seu cupom atual', activated: true)
              else
                showInfo('Este é o seu cupom atual', activated: false)
            else if (store.selectedCupom?['tipo'] != null &&
                store.selectedCupom?['tipo'] == cardName)
              showInfo('Alterar para o ${cardName.toLowerCase()}',
                  activated: true)
            else
              showInfo('Clique para alterar o cupom', activated: false),
            SizedBox(
              height: 293,
              width: 224,
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
      height: 310,
      width: 232,
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
