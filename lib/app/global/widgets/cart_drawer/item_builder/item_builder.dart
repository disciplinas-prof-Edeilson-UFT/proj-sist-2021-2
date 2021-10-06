import 'package:flutter/material.dart';

class DrawerBuilder extends StatefulWidget {
  final String name;
  final IconData icon;
  final double price;
  final double deliveryFee;
  final double totalprice;
  final int quantity;

  DrawerBuilder({
    required this.name,
    required this.icon,
    required this.price,
    required this.deliveryFee,
    required this.totalprice,
    required this.quantity,
  });

  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
