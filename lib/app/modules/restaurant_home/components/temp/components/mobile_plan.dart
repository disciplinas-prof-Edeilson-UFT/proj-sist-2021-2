import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/temp/components/desktop_plan.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';

class MobilePlan extends StatelessWidget {
  MobilePlan({ Key? key }) : super(key: key);
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final desktopPlan = DesktopPlan();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: desktopPlan.planSelector(
                  plan: const PlanCard(
                    image: "assets/images/cards/whitebackground.png",
                    colorBox: Colors.white,
                  ),
                  name: 'Plano Básico',
                ),
              ),
              desktopPlan.planSelector(
                plan: PlanCard(
                  image: "assets/images/cards/redbackground.png",
                  colorBox: Colors.red.shade900,
                ),
                name: 'Plano Entrega',
              ),
            ],
          ),
        ],
      ),
    );
  }
}