import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/action_buttons.dart';

class DrawerBuilder extends StatefulWidget {
  final Item model;

  const DrawerBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.2,
          child: ListTile(
            title: Text(
              widget.model.product.name.toString(),
            ),
            leading: Text(
              widget.model.quantidade.toString() + " x",
            ),
            trailing: Wrap(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "R\$ " +
                        FormatMoney.doubleToMoney(widget.model.product.price! *
                            widget.model.quantidade),
                  ),
                ),
              ],
            ),
          ),
        ),
        const ActionButtons()
      ],
    );
  }
}
