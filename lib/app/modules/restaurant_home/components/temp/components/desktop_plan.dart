import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';

class DesktopPlan extends StatelessWidget {
  DesktopPlan({ Key? key }) : super(key: key);
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final double _cardWidth = 300;
  final double _cardHeight = 400;
  final Color redOpaqueColor = secondaryColor.withOpacity(0.7);
  final Color greyOpaqueColor = tertiaryColor.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: planSelector(
            plan: const PlanCard(
              image: "assets/images/cards/whitebackground.png",
              colorBox: Colors.white,
            ),
            cardName: 'Plano Básico',
          ),
        ),
        planSelector(
          plan: PlanCard(
            image: "assets/images/cards/redbackground.png",
            colorBox: Colors.red.shade900,
          ),
          cardName: 'Plano Entrega',
        ),
      ],
    );
  }

  Widget planSelector ({required PlanCard plan, required String cardName}) {
    return Observer(
      builder: (_) {
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => store.selectPlan(cardName),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (store.actualPlan == cardName)
                if (store.selectedPlan == null || store.selectedPlan == cardName)
                  showInfo('Este é o seu plano atual', redOpaqueColor)
                else
                  showInfo('Este é o seu plano atual', greyOpaqueColor)
              else
                if (store.selectedPlan != null && store.selectedPlan == cardName)
                  showInfo('Alterar para o ${cardName.toLowerCase()}', redOpaqueColor)
                else
                  showInfo('Clique para alterar o plano', greyOpaqueColor),
              SizedBox(
                height: _cardHeight,
                width: _cardWidth,
                child: plan
              ),
            ],
          ),
        );
      }   
    );
  }

  Widget showInfo (String message, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      height: _cardHeight + 24,
      width: _cardWidth + 10,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          message,
          style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Nunito'),
        ),
      ),
    );
  }
}