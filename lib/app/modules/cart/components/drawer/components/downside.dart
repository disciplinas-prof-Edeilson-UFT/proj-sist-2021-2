import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/btn_builder.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/cpn_field.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/order_resume.dart';

class DraewDownside extends StatelessWidget {
  final double auxWidth;
  final String buttonTxt;
  final String route;
  const DraewDownside({
    Key? key,
    required this.auxWidth,
    required this.buttonTxt,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: CupomField(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Order(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: ButtonBuilder(
            buttonTxt: buttonTxt,
            auxWidth: auxWidth,
            route: route,
          ),
        ),
      ],
    );
  }
}
