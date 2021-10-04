// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
This is the Restaurant card, containing informations and an round avatar from restaurants.

From this component is EXPECTED: 
 - recieve data from superclasses and build accordingly.
*/

class RestaurantCard extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> restaurant;
  const RestaurantCard(this.restaurant, {Key? key}) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  
  Color _color = Colors.white;
  final BorderRadius _borderRadius = BorderRadius.circular(6);

  final TextStyle _cardInfoStyle = TextStyle(
    color: Color(0xff717171),
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: _borderRadius,
      hoverColor: null,
      onTap: () {},
      onHover: (_hovering) {
        if (_hovering) {
          setState(() {
            _color = Colors.grey[200]!;
          });
        } else {
          setState(() {
            _color = Colors.white;
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _color,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.restaurant['image']),
                backgroundColor: Colors.white,
                maxRadius: 45,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.restaurant['social_name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ChampionRestaurant(), // ADD isChampion? check
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Color(0XFFe8a44c),
                      ),
                      Text(
                        widget.restaurant['avaliation']
                            .toStringAsFixed(1),
                        style: TextStyle(
                          color: Color(0XFFe8a44c),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " • " +
                        widget.restaurant['category'] +
                        " • " +
                        widget.restaurant['distance'].toString() +
                        'km',
                        style: _cardInfoStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.restaurant['estimated_delivery'].toString() +
                        ' min' +
                        " • " +
                        'R\$' +
                        widget.restaurant['delivery_price']
                            .toStringAsFixed(2),
                    style: _cardInfoStyle,
                  ),
                  Container(
                    child: widget.restaurant['cupom'] != null
                      ? CupomCard(restaurant: widget.restaurant)
                      : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChampionRestaurant extends StatelessWidget {
  const ChampionRestaurant({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset("lib/app/modules/home/assets/images/iconmarmita.png", height: 28),
      onTap: () {
        //NAVIGATE para o restaurante.
      },
      onHover: (_hovering) {
        if (_hovering) {
          //print("ESTE EH UM ESTABELECIMENTO CAMPEAO");
        }
      },
    );
  }
}


class CupomCard extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> restaurant;
  const CupomCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xffEFF3F5),
        ),
        height: 25,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                "lib/app/modules/home/assets/images/cupom.png",
                width: 15,
                height: 15,
              ),
            ),
            Expanded(
              child: Text(
                'Cupom de R\$${restaurant['cupom']} disponível',
                style: TextStyle(
                  color: Color(0xFF2e6788),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
