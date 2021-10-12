import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/button_builder.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/cupon_field.dart';
import 'package:pscomidas/app/modules/cart/components/drawer/components/oder_resume.dart';

class DraewDownside extends StatefulWidget {
  const DraewDownside({Key? key}) : super(key: key);

  @override
  _DraewDownsideState createState() => _DraewDownsideState();
}

class _DraewDownsideState extends State<DraewDownside> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: const CupomField(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: const OrderResume(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.bottomCenter,
          child: const ButtonBuilder(),
        ),
      ],
    );
  }
}
