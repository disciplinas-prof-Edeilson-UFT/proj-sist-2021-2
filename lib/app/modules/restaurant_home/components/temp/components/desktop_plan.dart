import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';

class DesktopPlan extends StatelessWidget {
  DesktopPlan({ Key? key }) : super(key: key);
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  final double _cardWidth = 300;
  final double _cardHeight = 400;

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
            name: 'Plano Básico',
          ),
        ),
        planSelector(
          plan: PlanCard(
            image: "assets/images/cards/redbackground.png",
            colorBox: Colors.red.shade900,
          ),
          name: 'Plano Entrega',
        ),
      ],
    );
  }

  Widget planSelector ({required PlanCard plan, required String name}) {

    return Observer(
      builder: (context) {
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            store.selectPlan(name);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (store.actualPlan == name && (store.selectedPlan == null || store.selectedPlan == store.actualPlan))
                showInfo('Este é o seu plano atual', 18)
              else if (store.actualPlan != name && store.selectedPlan != null && store.selectedPlan != store.actualPlan)
                showInfo('Clique em confirmar para alterar o plano', 16),
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

  Widget showInfo (String message, double fsize) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 48, 48, 0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      height: _cardHeight + 24,
      width: _cardWidth + 10,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          message,
          style: TextStyle(fontSize: fsize, color: Colors.white, fontFamily: 'Nunito'),
        ),
      ),
    );
  }
}