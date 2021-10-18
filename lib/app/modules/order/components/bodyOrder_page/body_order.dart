import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/%5BDELETAR%5D%20class/visible.dart';
import 'package:pscomidas/app/modules/order/components/bodyOrder_page/ListView/listView.dart';
import 'package:pscomidas/app/modules/order/components/bodyOrder_page/Status_Order/status_order.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final OrderStore store = Modular.get();

  Visible _visible = Visible(false, 'não foi mudao');

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                return const Text(
                  'Meus Pedidos',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'),
                );
              }),
              SizedBox(
                height: screen.height * 0.01,
              ),
              _listView(context),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print('Body: ${_visible.hashCode}, ${_visible.visible},${_visible.test}');
            },
            child: Text('oi')
          ),

        _visible.visible == false ? Visibility(visible: false, child: StatusOrder()) : Visibility(visible: true, child: StatusOrder())
      ],
    );
  }


  Widget _listView(BuildContext context) {
    final OrderStore store = Modular.get();
    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height * 0.7,
      child: ListView.builder(
        itemCount: store.order.length,
        itemBuilder: (context, index){
          return _cardOrder(context, index, store);
        },
      ),
    );
  }

  Widget _cardOrder(BuildContext context, int index, OrderStore store){
  final Size screen = MediaQuery.of(context).size;
  return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: screen.width * 0.1, height: screen.width * 0.1,
                child: Image.asset(
                    'assets/images/filter.png'), // Imagem do restaurante
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: screen.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${store.order.elementAt(index).restaurante}',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: screen.width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Id: ${store.order.elementAt(index).id}',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: screen.width * 0.015,
                                )),
                            Text('Entrega até ${store.order.elementAt(index).previsao}',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: screen.width * 0.015,
                                )),
                          ],
                        );
                      }),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Status: ',
                                style: TextStyle(color: tertiaryCollor),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  'Pendente',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _visible.setVisible();
        });
        print(index);
      }, // adiciona rota aqui
    );
  }



}
