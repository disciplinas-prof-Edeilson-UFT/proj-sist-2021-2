import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/desktop_cart_drawer.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/pages/tablet_cart_drawer.dart';

class CartDrawer extends StatefulWidget {
  final List<Item> placeHolder;

  const CartDrawer({
    Key? key,
    required this.placeHolder,
  }) : super(key: key);

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  final CartStore store = Modular.get();
  final GlobalKey drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.25,
      child: Drawer(
        key: drawerKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            var height = constraints.maxHeight;
            if (height <= 768) {
              return const TabletCartDrawer();
            } else {
              return const DesktopCartDrawer();
            }
          },
        ),
      ),
    );
  }
}
