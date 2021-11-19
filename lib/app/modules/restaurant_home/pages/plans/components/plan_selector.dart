import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';

class PlanSelector extends StatelessWidget {
  PlanSelector({Key? key, required this.cardName, required this.plan})
      : super(key: key);
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final String cardName;
  final PlanCard plan;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return InkWell(
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        onTap: () => store.selectPlan(cardName),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (store.actualPlan == cardName)
              if (store.selectedPlan == null || store.selectedPlan == cardName)
                showInfo('Este é o seu plano atual', activated: true)
              else
                showInfo('Este é o seu plano atual', activated: false)
            else if (store.selectedPlan != null &&
                store.selectedPlan == cardName)
              showInfo('Alterar para o ${cardName.toLowerCase()}',
                  activated: true)
            else
              showInfo('Clique para alterar o plano', activated: false),
            SizedBox(
              height: 400,
              width: 300,
              child: plan,
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
        borderRadius: BorderRadius.circular(16),
      ),
      height: 424,
      width: 310,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          message,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontFamily: 'Nunito'),
        ),
      ),
    );
  }
}
