import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class ButtonBuilder extends StatefulWidget {
  const ButtonBuilder({Key? key}) : super(key: key);

  @override
  _ButtonBuilderState createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<ButtonBuilder> {
  final CartStore store = Modular.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: ElevatedButton(
        onPressed: () => store.cadastroTeste(),
        child: const Text(
          'Escolher forma de pagamento',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shadowColor: Colors.black26,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
      ),
    );
  }
}