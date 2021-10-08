import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/cart_drawer/placeholder/pedido.dart';

class DrawerBuilder extends StatefulWidget {
  final ItemModel model;

  DrawerBuilder({
    required this.model,
  });

  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Icon(widget.model.icon, size: 33),
        ],
      ),
    );
  }
}
