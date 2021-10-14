import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/btn_builder.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/cpn_field.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/mobile/order_resume.dart';

class MobileDraewDownside extends StatelessWidget {
  final double auxWidth;
  const MobileDraewDownside({
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
          child: MobileCupomField(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: MobileOrder(auxWidth: auxWidth),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: MobileButtonBuilder(),
        ),
      ],
    );
  }
}
