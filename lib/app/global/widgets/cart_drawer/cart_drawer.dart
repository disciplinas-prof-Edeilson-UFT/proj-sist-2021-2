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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Drawer(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (() => {}),
                    child: const Text('Pagar'),
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
