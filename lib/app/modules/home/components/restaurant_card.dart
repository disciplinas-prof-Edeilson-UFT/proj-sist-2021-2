import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/restaurant.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_championship.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_picture.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_module.dart';
import '/app/modules/home/store/restaurant_card.store.dart';
import 'cupom/cupom_card.dart';

/* Este é o card do restaurante, construido conforme necessidade pelo Gridview em ../restaurant_grid.
 Algumas features aqui devem ser implementadas posteriormente ou excluídas,
 sendo estas os cupons e o championship dos restaurantes, presentes no ifood mas não implementadas no database.
*/

class RestaurantCard extends StatelessWidget {
  final BorderRadius _borderRadius = BorderRadius.circular(6);
  final store = RestaurantCardStore();
  final Restaurant restaurant;

  final TextStyle _separatorStyle = const TextStyle(
    fontSize: 11,
    color: Color(0xff717171),
  );

  final TextStyle _cardInfoStyle = const TextStyle(
    color: Color(0xff717171),
    fontSize: 13.4,
    fontFamily: 'Nunito',
  );

  final TextStyle _freeStyle = const TextStyle(
    color: Color(0xff87A491),
    fontSize: 13,
    fontFamily: 'Nunito',
  );

  RestaurantCard(this.restaurant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delivery = (restaurant.deliveryPrice == 0
        ? TextSpan(
            text: 'Grátis',
            style: _freeStyle,
          )
        : TextSpan(
            text: FormatMoney.doubleToMoney(restaurant.deliveryPrice),
            style: _cardInfoStyle,
          ));
    return InkWell(
      borderRadius: _borderRadius,
      onTap: () {
        Modular.to.navigate(
          RestaurantModule.routeName,
          arguments: restaurant,
        );
      },
      onHover: (_hovering) {
        store.colordefine(_hovering);
      },
      child: Observer(
        builder: (_) => AnimatedContainer(
          height: 120,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: store.color,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RestaurantPicture(
                  picture: restaurant.image,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            restaurant.socialName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ChampionRestaurant(restaurant: restaurant),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: Color(0XFFe8a44c),
                        ),
                        Text(
                          restaurant.avaliation!.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Color(0XFFe8a44c),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(text: " • ", style: _separatorStyle),
                            TextSpan(
                              text: restaurant.category.toString(),
                              style: _cardInfoStyle,
                            ),
                            TextSpan(
                              text: " • ",
                              style: _separatorStyle,
                            ),
                            TextSpan(
                                text: restaurant.distance.toString() + " km",
                                style: _cardInfoStyle),
                          ]),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: restaurant.estimatedDelivery + " min",
                              style: _cardInfoStyle),
                          TextSpan(text: " • ", style: _separatorStyle),
                          delivery,
                        ],
                      ),
                    ),
                    restaurant.cupom != null
                        ? CupomCard(cupom: restaurant.cupom)
                        : const SizedBox(height: 28),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
