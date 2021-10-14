import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// PROPOSIÇÃO de implementação de cupons para entrega grátis e desconto.
// CUPONS DE ENTREGA GRÁTIS são maps no database com atributos -> {"tipo":"entrega_gratis"}
// CUPONS DE DESCONTO são maps no database com atributos -> {"tipo":"desconto", "valor":(number)}

class CupomCard extends StatelessWidget {
  final Map<String, dynamic>? cupom;
  const CupomCard({Key? keys, required this.cupom}) : super(key: keys);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xffEFF3F5),
        ),
        height: 25,
        width: cupom!['tipo'] == 'desconto' ? 200 : 185,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _cupomLeading(),
            ),
            Expanded(
              child: _cupomText(),
            ),
          ],
        ),
      ),
    );
  }

  Image _cupomLeading() {
    if (cupom!['tipo'] == 'desconto') {
      return Image.asset(
        'lib/app/modules/home/assets/images/cupom.png',
        height: 15,
      );
    } else {
      return Image.asset(
          "lib/app/modules/home/assets/images/entrega_gratis.png",
          height: 15);
    }
  }

  final _cupomTextStyle = const TextStyle(
    color: Color(0xFF2e6788),
    fontSize: 13,
    fontFamily: 'Nunito',
  );

  Text _cupomText() {
    if (cupom!['tipo'] == 'desconto') {
      return Text(
        'Cupom de R\$${cupom!['valor']} disponível',
        style: _cupomTextStyle,
      );
    } else {
      return Text(
        'Entrega grátis disponível',
        style: _cupomTextStyle,
      );
    }
  }
}
