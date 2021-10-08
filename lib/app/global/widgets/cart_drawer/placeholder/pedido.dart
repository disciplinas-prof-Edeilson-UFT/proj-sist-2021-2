import 'package:flutter/material.dart';

class ItemModel {
  String name;
  IconData icon;
  double price;
  double deliveryFee;
  double totalprice;
  int quantity;

  ItemModel({
    required this.name,
    required this.icon,
    required this.price,
    required this.deliveryFee,
    required this.quantity,
    required this.totalprice,
  });
}
