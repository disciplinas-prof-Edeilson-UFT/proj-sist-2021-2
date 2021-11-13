import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/desktop_cart_drawer.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/empty_drawer.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/mobile_cart_drawer.dart';

class CartDrawer extends StatelessWidget {
  final double width;
  CartDrawer({
    Key? key,
    required this.width,
  }) : super(key: key);

  final CartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Drawer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var height = constraints.maxHeight;
            if (store.itens.isEmpty) {
              return EmptyDrawer(width: width);
            } else if (height <= 647 && width < 1360) {
              return MobileCartDrawer(
                buttonTxt: 'Continuar',
                mobileLargura: width,
              );
            } else {
              return DesktopCartDrawer(
                deskLargura: width,
                buttonTxt: 'Continuar',
              );
            }
          },
        ),
      ),
    );
  }
}
