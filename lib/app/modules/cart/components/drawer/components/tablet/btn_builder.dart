import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/cart/components/cards/pages/select_card.dart';

class TabletButtonBuilder extends StatelessWidget {
  TabletButtonBuilder({
    Key? key,
  }) : super(key: key);

  final CartStore store = Modular.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.2,
      child: ElevatedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => SelectCardDialog(),
        ),
        child: const Text(
          'Escolher forma de pagamento',
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
