import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class BtnOrder extends StatelessWidget {
  final String name;
  const BtnOrder({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: secondaryColor,
      ),
      onPressed: () => Modular.to.navigate('/Track'),
      child: Text(
        name,
        style: const TextStyle(
            fontFamily: 'Nunito', fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}
