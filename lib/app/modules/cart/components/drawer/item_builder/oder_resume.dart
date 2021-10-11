import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';

class OrderResume extends StatefulWidget {
  const OrderResume({Key? key}) : super(key: key);

  @override
  _OrderResumeState createState() => _OrderResumeState();
}

class _OrderResumeState extends State<OrderResume> {
  final CartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Subtotal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text('R\$ ' + FormatMoney.doubleToMoney(store.total - 12.5),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    )),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text('Valor da entrega',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    )),
                Text('R\$ 12,50',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    )),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Valor total do pedido',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Text('R\$ ' + FormatMoney.doubleToMoney(store.total),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
        ],
      ),
    );
  }
}
