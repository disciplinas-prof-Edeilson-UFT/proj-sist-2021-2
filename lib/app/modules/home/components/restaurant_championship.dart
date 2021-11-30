import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';

// Feature a ser totalmente implementada.
/*PROPOSIÇÃO DE CHAMPIONSHIP/VERIFICADO de restaurantes.
- Alguns restaurantes (e não filiais, i.e mcdonald's) no ifood são "verificados" com uma estrela vermelha
chamada de championship. Este arquivo define a proposta de implementação. No banco de dados o atributo 
booleano isChampion indica se um restaurante é ou não verificado. A falta do atributo possui error handler.
*/
class ChampionRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const ChampionRestaurant({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      restaurant.isChampion;
    } catch (e) {
      return Container();
    }

    if (!restaurant.isChampion) {
      return Container();
    }
    return InkWell(
      child: Image.asset("lib/app/modules/home/assets/images/iconmarmita.png",
          height: 28),
      onTap: () {
        Modular.to.navigate(
          RestaurantModule.routeName,
          arguments: restaurant,
        );
      },
    );
  }
}
