// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.restaurant['image']),
                    maxRadius: 45,
                  ),
                  SizedBox(
                    width: 14,
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
                              child: Icon(Icons.star_half, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.orange[600],
                            ),
                            Text(
                              widget.restaurant['avaliation'].toString(),
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(" • "),
                            Text(widget.restaurant['category']),
                            Text(" • "),
                            Text(widget.restaurant['distance'].toString() +
                                'km'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(widget.restaurant['estimated_delivery']
                                    .toString() +
                                ' min'),
                            Text(" • "),
                            Text('R\$' +
                                widget.restaurant['delivery_price']
                                    .toString()
                                    .padRight(2, ".00")),
                          ],
                        ),
                      ],
                    ),
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
