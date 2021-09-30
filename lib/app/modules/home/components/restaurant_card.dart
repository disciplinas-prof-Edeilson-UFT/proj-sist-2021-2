// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/*
This is the Restaurant card, containing informations and an round avatar from restaurants.

From this component is EXPECTED: 
 - recieve data from superclasses and build accordingly.
*/

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({ Key? key }) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  final src = "https://th.bing.com/th/id/R.e376cc02c62e0026099e4e4329908ff7?rik=%2f1KV0uFGfTsH1Q&riu=http%3a%2f%2fwww.comofazer.org%2fwp-content%2fuploads%2f2012%2f07%2fgatinho-persa.jpg&ehk=1AVyB7CJkEXS%2bGxIo45I5BLR829JCYCPS8lmGXla%2b34%3d&risl=&pid=ImgRaw&r=0";
  Color _color = Colors.white;
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _color,  
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(             
              backgroundImage: NetworkImage(src),
              maxRadius: 45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Text('Gatinho\'s Bar e Restaurante • Palmas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, size: 15, color: Colors.orange[600],),
                    Text('5.4', style: TextStyle(color: Colors.orange[600]),),
                    Text(" • "),
                    Text("Lanches"),
                    Text(" • "),
                    Text("2.2km"),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Text("25-40 min"),
                    Text(" • "),
                    Text("R\$ 14,99"),
                  ],
                ),
              ],
            ),
            Align(child: Icon(Icons.star_half, color: Colors.red), alignment: Alignment.topRight,),
          ],
        ),
      ),
    );
  }
}