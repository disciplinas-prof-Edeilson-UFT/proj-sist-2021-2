import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/item_builder/item_builder.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/placeholder/pedido.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class CartDrawer extends StatefulWidget {
  final List<ItemModel> placeHolder;

  CartDrawer({
    required this.placeHolder,
  });

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
            Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: widget.placeHolder.length,
                itemBuilder: (context, index) => Container(
                  child: DrawerBuilder(
                    name: widget.placeHolder[index].name,
                    icon: widget.placeHolder[index].icon,
                    price: widget.placeHolder[index].price,
                    deliveryFee: widget.placeHolder[index].deliveryFee,
                    totalprice: widget.placeHolder[index].totalprice,
                    quantity: widget.placeHolder[index].quantity,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
