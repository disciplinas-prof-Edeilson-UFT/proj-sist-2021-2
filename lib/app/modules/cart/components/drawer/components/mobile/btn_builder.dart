import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class MobileButtonBuilder extends StatelessWidget {
  MobileButtonBuilder({
    Key? key,
  }) : super(key: key);

  final CartStore store = Modular.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.26,
      child: ElevatedButton(
        onPressed: () => store.cadastroTeste(),
        child: const Text(
          'Pagamento',
          style: TextStyle(
            fontSize: 16,
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
