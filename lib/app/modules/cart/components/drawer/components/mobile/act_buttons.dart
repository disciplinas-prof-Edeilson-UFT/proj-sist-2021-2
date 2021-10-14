import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class MobileActionButtons extends StatelessWidget {
  MobileActionButtons({
    Key? key,
  }) : super(key: key);

  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => {},
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Editar',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.red,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Remover',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Nunito',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
