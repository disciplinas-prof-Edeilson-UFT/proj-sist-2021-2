import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pre_drawer_selector.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = 'CartPage'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final CartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return const CartDrawerSelector();
  }
}
