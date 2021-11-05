import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/btn_to.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/image_to.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/name_store_to.dart';

class StackTO extends StatelessWidget {
  const StackTO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        ImageTO(),
        Container(
          color: Colors.white.withOpacity(0.7),
        ),
        Positioned(
            //right: 0,
            top: 160,
            child: Container(
              width: screen.width * 0.35,
              height: screen.height * 0.20,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [NameStoreTO(), TBnTO(name: 'Detalhes do pedido')],
              ),
            )),
        Positioned(
            top: 400,
            child: Container(
              child: Column(
                children: [
                  //color: Colors.amber,
                  Text(
                    'Algo errado com seu pedido?',
                    style: TextStyle(
                      fontSize: 15.0,
                      //fontStyle: FontStyle.normal,
                    ),
                  ),

                  TBnTO(name: 'Entre em contato com a loja'),
                ],
              ),
            ))
      ],
    );
  }
}
