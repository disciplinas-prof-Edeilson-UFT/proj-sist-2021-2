import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/plans/components/plan_selector.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';

class MobilePlan extends StatelessWidget {
  const MobilePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              PlanSelector(
                plan: const PlanCard(
                  image: "assets/images/cards/whitebackground.png",
                  colorBox: Colors.white,
                ),
                cardName: 'Plano Básico',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: PlanSelector(
                  plan: PlanCard(
                    image: "assets/images/cards/redbackground.png",
                    colorBox: Colors.red.shade900,
                  ),
                  cardName: 'Plano Entrega',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
