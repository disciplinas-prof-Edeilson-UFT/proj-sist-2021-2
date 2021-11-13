import 'package:flutter/material.dart';

// Feature a ser totalmente implementada.
/*PROPOSIÇÃO DE CHAMPIONSHIP/VERIFICADO de restaurantes.
- Alguns restaurantes (e não filiais, i.e mcdonald's) no ifood são "verificados" com uma estrela vermelha
chamada de championship. Este arquivo define a proposta de implementação. No banco de dados o atributo 
booleano isChampion indica se um restaurante é ou não verificado. A falta do atributo possui error handler.
*/
class ChampionRestaurant extends StatelessWidget {
  final bool isChampion;
  const ChampionRestaurant({Key? key, required this.isChampion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      isChampion;
    } catch (e) {
      return Container();
    }

    if (!isChampion) {
      return Container();
    }
    return InkWell(
      child: Image.asset("lib/app/modules/home/assets/images/iconmarmita.png",
          height: 28),
      onTap: () {},
    );
  }
}
