import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({
    Key? key,
  }) : super(key: key);

  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => {},
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Editar',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
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
