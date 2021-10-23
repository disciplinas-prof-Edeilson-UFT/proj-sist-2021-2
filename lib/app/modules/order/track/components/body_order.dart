import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/order.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository_interface.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/class/orders.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:pscomidas/app/modules/order/track/components/cancel_order.dart';
import 'package:pscomidas/app/modules/order/track/components/empty_order.dart';
import 'package:pscomidas/app/modules/order/track/components/info_order.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final OrderStore store = Modular.get();

  /// Pedido que será adicionado, apenas para testes pode [DELETAR] quando terminar.
  OrdersList data = OrdersList(
      restaurante: 'MacDonalds',
      id: '9999',
      previsao: '15:30',
      status: 'Em preparo');

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Text(
              'Meus Pedidos',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'
                ),
              ),

              /// Botão para adicionar um card [DELETAR], serve apenas para testes
              ElevatedButton(
                onPressed: () {},
                child: const Text('data')
              ),

              SizedBox(
                height: screen.height * 0.01,
              ),

              // Retorna 2 Widgets, onde um é para caso não tenha pedidos e o outro caso tenha.
              /*Observer(
                builder: (_) {
                  return store.order.isEmpty
                      ? const EmptyOrder()
                      : _listViewOrder(context);
                },
              )*/
              _listViewOrder(context)
            ],
          ),
        ),

        
        ElevatedButton(
          onPressed: () => null, //  _orderDetails(),
          child: const Text('Detalhes do produto')
        )
      ],
    );
  }

  /// [ListViewOrder] lista de order
  Widget _listViewOrder(BuildContext context) {
   // final OrderStore store = Modular.get();
    //final Size screen = MediaQuery.of(context).size;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    OrderRepository orderRepository = OrderRepository(firestore: firestore, auth: auth);


    return Container();

  }

  /* 
  
  SizedBox(
      width: screen.width,
      height: screen.height * 0.6,
      child: ListView.builder(
        itemCount: store.order.length,
        itemBuilder: (context, index) {
          return _cardOrder(context, index, store);
        },
      ),
    );
  
  */

  /// [CardOrder] card da order
  Widget _cardOrder(BuildContext context, int index, OrderStore store) {
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {},
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.order.elementAt(index).restaurante,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: screen.width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Id: ${store.order.elementAt(index).id}',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: screen.width * 0.015,
                              )
                            ),
                            Text(
                              'Entrega até ${store.order.elementAt(index).previsao}',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: screen.width * 0.015,
                              )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Status: ',
                                  style: TextStyle(color: tertiaryCollor),
                                ),
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
      ),
    );
  }

  /// [InfoOrder] page que mostará os detalhes do pedido
  Widget _orderDetails() {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height,
      color: primaryCollor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: primaryCollor,
              width: screen.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: secondaryCollor,
                    )),
                  const Text(
                    'Detalhes do pedido',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer() // Não deleta, esse container ta servindo para centralizar o texto
                ],
              ),
            ),
            _statusOrderinfo(),
            SizedBox(
              height: screen.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container p/ as informações do pedido

                const InfoOrder(),

                Container(
                    // Container p/ ficar os botões
                  width: screen.width * 0.4,
                  height: screen.height * 0.5,
                  decoration: _containerDecoration(),
                  child: const CancelOrder()
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// [Divisor dos Status], local da R06/T02
  Widget _statusOrderinfo() {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height * 0.2,
      decoration: _containerDecoration(),
      child: const Text('Status Order, local para adicionar a task R06/T02'),
    );
  }

  /// [BoxShadow] dos container divisores
  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: primaryCollor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Colors.black54, blurRadius: 7, offset: Offset(0, 3))
      ]);
  }
}
