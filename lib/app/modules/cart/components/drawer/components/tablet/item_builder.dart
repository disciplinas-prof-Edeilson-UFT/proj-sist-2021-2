import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/act_buttons.dart';

class TabletDrawerBuilder extends StatefulWidget {
  final Item model;
  final double auxWidth;
  final double auxHeight;
  const TabletDrawerBuilder({
    Key? key,
    required this.model,
    required this.auxWidth,
    required this.auxHeight,
  }) : super(key: key);

  @override
  _TabletDrawerBuilderState createState() => _TabletDrawerBuilderState();
}

class _TabletDrawerBuilderState extends State<TabletDrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: widget.auxWidth * 0.9,
          child: ListTile(
            title: Text(
              widget.model.product.name.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: Text(
              widget.model.quantidade.toString() + " x",
              style: const TextStyle(
                fontSize: 14,
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
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        TabletActionButtons()
      ],
    );
  }
}
