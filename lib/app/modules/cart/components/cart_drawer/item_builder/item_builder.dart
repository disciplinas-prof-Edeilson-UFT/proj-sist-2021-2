import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';

class DrawerBuilder extends StatefulWidget {
  final Item model;

  DrawerBuilder({
    required this.model,
  });

  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListTile(
        title: Text(widget.model.product.name.toString()),
        leading: Text(
          "x " + widget.model.quantidade.toString(),
        ),
        trailing: Wrap(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "R\$ " +
                    FormatMoney.doubleToMoney(
                        widget.model.product.price! * widget.model.quantidade),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
