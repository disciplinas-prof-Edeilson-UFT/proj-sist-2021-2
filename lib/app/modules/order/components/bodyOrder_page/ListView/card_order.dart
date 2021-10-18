import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/%5BDELETAR%5D%20class/visible.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class CardOrder extends StatefulWidget {
  final index;
  Visible visible;
  CardOrder({Key? key, required this.index, required this.visible}) : super(key: key);

  @override
  State<CardOrder> createState() => _CardOrderState();
}

class _CardOrderState extends State<CardOrder> {
  @override
  Widget build(BuildContext context) {
    final OrderStore store = Modular.get();
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            setState(() {
              print(widget.visible.hashCode);
              widget.visible.setVisible();
              widget.visible.setTest();
            });
            print(widget.index);
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
                                '${store.order.elementAt(widget.index).restaurante}',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: screen.width * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Id: ${store.order.elementAt(widget.index).id}',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: screen.width * 0.015,
                                  )),
                              Text('Entrega até ${store.order.elementAt(widget.index).previsao}',
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
      ),// adiciona rota aqui
    );
  }
}
