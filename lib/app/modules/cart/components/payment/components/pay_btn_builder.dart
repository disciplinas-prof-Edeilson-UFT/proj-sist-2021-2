import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class PayButtonBuilder extends StatelessWidget {
  final String buttonTxt;
  final double auxWidth;
  final String route;
  PayButtonBuilder({
    Key? key,
    required this.auxWidth,
    required this.buttonTxt,
    required this.route,
  }) : super(key: key);

  final CartStore store = Modular.get<CartStore>();
  @override
  Widget build(BuildContext context) {
    const double size = 2;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: auxWidth * 0.9,
      child: ElevatedButton(
        onPressed: () => {
          store.cadastroTeste(),
          Modular.to.navigate(route),
        },
        child: AutoSizeText(
          buttonTxt,
          presetFontSizes: const [20, 16, 12],
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: size,
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
