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
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListTile(
              leading: Icon(
                widget.model.icon,
                size: 33,
              ),
              trailing: Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      widget.model.price.toString(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "x" + widget.model.quantity.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
