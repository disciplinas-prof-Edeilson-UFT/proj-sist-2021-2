import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/desktop_cart_drawer.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/empty_drawer.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/mobile_cart_drawer.dart';

class CartDrawer extends StatelessWidget {
  final double largura;
  CartDrawer({
    Key? key,
    required this.largura,
  }) : super(key: key);

  final CartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura,
      child: Drawer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var height = constraints.maxHeight;
            if (store.itens.isEmpty) {
              return EmptyDrawer(largura: largura);
            } else if (height <= 647 && largura < 1360) {
              return MobileCartDrawer(
                buttonTxt: 'Continuar',
                mobileLargura: largura,
              );
            } else {
              return DesktopCartDrawer(
                deskLargura: largura,
                buttonTxt: 'Continuar',
              );
            }
          },
        ),
      ),
    );
  }
}
