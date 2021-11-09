import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/rating/rating_prodct.dart';
import 'package:pscomidas/app/modules/order/components/track/components/btn_order.dart';
import 'package:pscomidas/app/modules/order/components/track/components/cancel/cancel_order.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Card(
      child: Column(children: [
        ListTile(
          title: Text('Previxão de entrega', style: _textStyleSubtitle()),
          subtitle: Text('Hoje, 19:20 - 19:30', style: _textStyleTitle()),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/mc.png'),
          ),
          title: Text('McDonald\'s', style: _textStyleTitle()),
          subtitle: Text(
            'Pedido . N° 9999',
            style: _textStyleSubtitle(),
          ),
        ),
        Divider(
          height: screen.width * 0.022,
          thickness: 0.2,
          indent: 10,
          endIndent: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _btnSelect(
              status:
                  'Pedido Aceito'), //TODO change it to status: store.order!.status.toString()
          const BtnOrder(name: 'Acompanhar'),
        ])
      ]),
    );
  }

  TextStyle _textStyleTitle() {
    return const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  TextStyle _textStyleSubtitle() {
    return const TextStyle(
        fontFamily: 'Nunito', fontSize: 12, color: Colors.grey);
  }

  _btnSelect({String? status}) {
    if (status != 'Pedido Completo') {
      return const CancelOrder();
    } else {
      return const RatingOrder();
    }
  }
}
