import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class InfoOrder extends StatefulWidget {
  const InfoOrder({ Key? key }) : super(key: key);

  @override
  _InfoOrderState createState() => _InfoOrderState();
}

class _InfoOrderState extends State<InfoOrder> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      width: screen.width * 0.55,
      height: screen.height * 0.5,
      decoration: BoxDecoration(
        color: primaryCollor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 7, offset: Offset(0, 3))
        ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Endereço de entrega',
                style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
              ),
              Text(
                'Q. 208 Sul, Alameda 10, 202',
                style: TextStyle(fontFamily: 'Nunito', color: tertiaryCollor),
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
                children: [Text('Valor do pedido'), Text('99,99 R\$')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Cupom'), Text('0,99 R\$')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Taxa de entrega'), Text('5,99 R\$')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style:
                      TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
                  ),
                  Text('104,99 R\$')
                ],
              ),
            ],
          )
          
        ],
      ),
    );
  }

  /// [Preço] do pedido, faz paarte do _infosOrder
  Widget _price() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Valor do pedido'), Text('99,99 R\$')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Cupom'), Text('0,99 R\$')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Taxa de entrega'), Text('5,99 R\$')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style:
                TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),
            ),
            Text('104,99 R\$')
          ],
        ),
      ],
    );
  }

}