import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/cart_drawer.dart';

class CartDrawerSelector extends StatelessWidget {
  const CartDrawerSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = screen.width;
        if (width < 1360) {
          var newWidth = width * 0.6;
          return CartDrawer(
            largura: newWidth,
          );
        } else {
          var newWidth = width * 0.3;
          return CartDrawer(
            largura: newWidth,
          );
        }
      },
    );
  }
}
