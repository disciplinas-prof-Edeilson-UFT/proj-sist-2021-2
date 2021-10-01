import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({Key? key}) : super(key: key);

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}
