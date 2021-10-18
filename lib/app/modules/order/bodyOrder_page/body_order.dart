import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/bodyOrder_page/status_order.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:pscomidas/app/modules/order/visible%20class/visible.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final OrderStore store = Modular.get();

  final Visible _visible = Visible(false, 'não foi mudao');

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
              _listViewOrder(context),
            ],
          ),
        ),

        /// Status order, irá sobrepor o [ListViewOrder], com o as informações da order
        Visibility(
          visible: _visible.visible,
          child: StatusOrder(),
        )
      ],
    );
  }

  /// [ListViewOrder]
  Widget _listViewOrder(BuildContext context) {
    final OrderStore store = Modular.get();
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width,
      height: screen.height * 0.7,
      child: ListView.builder(
        itemCount: store.order.length,
        itemBuilder: (context, index) {
          return _cardOrder(context, index, store);
        },
      ),
    );
  }

  /// [CardOrder]
  Widget _cardOrder(BuildContext context, int index, OrderStore store) {
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            setState(() {
              _visible.setVisible();
            });
          },
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
                                  )),
                              Text(
                                  'Entrega até ${store.order.elementAt(index).previsao}',
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
                                _statusOrder(store, index)
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

  /// Mostra o status do pedido, aqui é definido o status
  Widget _statusOrder(OrderStore store, int index) {
    String status = store.order.elementAt(index).status;
    Color cor_status = Colors.white;
    if (status == 'Em preparo') {
      cor_status = Colors.amber;
    } else if (status == 'A caminho') {
      cor_status = Colors.blue;
    } else if (status == 'Entregador chogou') {
      cor_status = Colors.green;
    }

    return Container(
      decoration: BoxDecoration(
          color: cor_status, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(5),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
