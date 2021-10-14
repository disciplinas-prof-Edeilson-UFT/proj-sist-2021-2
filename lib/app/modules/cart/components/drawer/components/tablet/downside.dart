import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/btn_builder.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/cpn_field.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/tablet/order_resume.dart';

class TabletDraewDownside extends StatelessWidget {
  final double auxWidth;
  const TabletDraewDownside({
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
          child: TabletCupomField(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: TabletOrder(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: TabletButtonBuilder(),
        ),
      ],
    );
  }
}
