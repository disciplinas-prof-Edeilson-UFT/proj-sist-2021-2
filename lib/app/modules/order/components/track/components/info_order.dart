import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class InfoOrder extends StatefulWidget {
  const InfoOrder({Key? key}) : super(key: key);

  @override
  _InfoOrderState createState() => _InfoOrderState();
}

class _InfoOrderState extends State<InfoOrder> {
  final OrderStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.55,
      height: screen.height * 0.28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Endereço de entrega',
                style: TextStyle(
                    fontFamily: 'Nunito', fontWeight: FontWeight.bold),
              ),
              Text(
                'Q. 208 Sul, Alameda 10, 202',
                style: TextStyle(fontFamily: 'Nunito', color: tertiaryColor),
              )
            ],
          ),
          const Divider(
            height: 30,
            thickness: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Valor do pedido'),
                  Text(FormatMoney.doubleToMoney(
                      store.order!.orderPrice - store.order!.shipPrice)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Cupom'), Text('R\$ 0,99')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Taxa de entrega'),
                  Text(FormatMoney.doubleToMoney(store.order!.shipPrice))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                        fontFamily: 'Nunito', fontWeight: FontWeight.bold),
                  ),
                  Text(FormatMoney.doubleToMoney(store.order!.orderPrice))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
