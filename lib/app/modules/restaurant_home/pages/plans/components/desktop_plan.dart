import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';
import 'plan_selector.dart';

class DesktopPlan extends StatelessWidget {
  const DesktopPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: PlanSelector(
            plan: const PlanCard(
              image: "assets/images/cards/whitebackground.png",
              colorBox: Colors.white,
            ),
            cardName: 'Plano Básico',
          ),
        ),
        PlanSelector(
          plan: PlanCard(
            image: "assets/images/cards/redbackground.png",
            colorBox: Colors.red.shade900,
          ),
          cardName: 'Plano Entrega',
        ),
      ],
    );
  }
}
