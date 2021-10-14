import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class DeskButtonBuilder extends StatelessWidget {
  DeskButtonBuilder({
    Key? key,
  }) : super(key: key);

  final CartStore store = Modular.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.15,
      child: ElevatedButton(
        onPressed: () => store.cadastroTeste(),
        child: const Text(
          'Escolher forma de pagamento',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Nunito',
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shadowColor: Colors.black26,
        ),
      ),
    );
  }
}
