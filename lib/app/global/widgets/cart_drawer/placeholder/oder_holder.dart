import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/cart_drawer.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/placeholder/pedido.dart';

class OrderHolder extends StatelessWidget {
  const OrderHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartDrawer(
      placeHolder: [
        ItemModel(
          name: "Dummy 1",
          icon: Icons.lunch_dining_outlined,
          price: 15.56,
          deliveryFee: 2.5,
          totalprice: 17.5,
          quantity: 1,
        ),
        ItemModel(
          name: "Dummy 2",
          icon: Icons.lunch_dining_outlined,
          price: 70.00,
          deliveryFee: 6.55,
          totalprice: 17.5,
          quantity: 1,
        ),
        ItemModel(
          name: "Dummy 3",
          icon: Icons.lunch_dining_outlined,
          price: 15.00,
          deliveryFee: 2.5,
          totalprice: 17.5,
          quantity: 1,
        ),
        ItemModel(
          name: "Dummy 4",
          icon: Icons.lunch_dining_outlined,
          price: 15.00,
          deliveryFee: 2.5,
          totalprice: 17.5,
          quantity: 1,
        ),
        ItemModel(
          name: "Dummy 5",
          icon: Icons.lunch_dining_outlined,
          price: 25.00,
          deliveryFee: 2.5,
          totalprice: 17.5,
          quantity: 1,
        ),
        ItemModel(
          name: "Dummy 6",
          icon: Icons.lunch_dining_outlined,
          price: 55.00,
          deliveryFee: 5.75,
          totalprice: 17.5,
          quantity: 3,
        ),
      ],
    );
  }
}
