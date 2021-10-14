import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/act_buttons.dart';

class MobileDrawerBuilder extends StatefulWidget {
  final Item model;
  final double auxWidth;
  final double auxHeight;
  const MobileDrawerBuilder({
    Key? key,
    required this.model,
    required this.auxWidth,
    required this.auxHeight,
  }) : super(key: key);

  @override
  _MobileDrawerBuilderState createState() => _MobileDrawerBuilderState();
}

class _MobileDrawerBuilderState extends State<MobileDrawerBuilder> {
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
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: Text(
              widget.model.quantidade.toString() + " x",
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w200,
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
                      fontSize: 10,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        MobileActionButtons()
      ],
    );
  }
}
