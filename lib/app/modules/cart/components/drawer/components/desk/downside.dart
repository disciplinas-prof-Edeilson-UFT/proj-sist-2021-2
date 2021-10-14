import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/desk/btn_builder.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/desk/cpn_field.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/desk/order_resume.dart';

class DeskDraewDownside extends StatelessWidget {
  final double auxWidth;
  const DeskDraewDownside({
    Key? key,
    required this.auxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: DeskCupomField(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: DeskOrder(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: DeskButtonBuilder(),
        ),
      ],
    );
  }
}
