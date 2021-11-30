import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class OrderResume extends StatelessWidget {
  final double auxWidth;
  OrderResume({
    Key? key,
    required this.auxWidth,
  }) : super(key: key);
  final CartStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    const double size = 16;
    return Observer(builder: (_) {
      return SizedBox(
        width: auxWidth * 0.8,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Nunito',
                  ),
                ),
                Text(
                  FormatMoney.doubleToMoney(store.total - 12.5),
                  style: const TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Entrega',
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Nunito',
                  ),
                ),
                Text(
                  'R\$ 12,50',
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('TOTAL',
                      style: TextStyle(
                        fontSize: size + 2,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      )),
                  Text(FormatMoney.doubleToMoney(store.total),
                      style: const TextStyle(
                        fontSize: size + 2,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      )),
                ]),
          ],
        ),
      );
    });
  }
}
