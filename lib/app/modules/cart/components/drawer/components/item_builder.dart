import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class DrawerBuilder extends StatefulWidget {
  final Item model;
  final double auxWidth;
  final double auxHeight;
  const DrawerBuilder({
    Key? key,
    required this.model,
    required this.auxWidth,
    required this.auxHeight,
  }) : super(key: key);

  @override
  _DrawerBuilderState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends State<DrawerBuilder> {
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: widget.auxWidth * 0.9,
          child: ListTile(
            title: Text(
              widget.model.product.name.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: Text(
              widget.model.quantidade.toString() + " x",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Wrap(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    FormatMoney.doubleToMoney(
                        widget.model.product.price! * widget.model.quantidade),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Editar',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                store.removeItem(widget.model.itemid);
              },
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Remover',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
