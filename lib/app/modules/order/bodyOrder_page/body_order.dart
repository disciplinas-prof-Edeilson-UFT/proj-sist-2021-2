import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/bodyOrder_page/status_order.dart';
import 'package:pscomidas/app/modules/order/class/orders.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final OrderStore store = Modular.get();

  bool _visible = false;
  void _setVisible() {
    setState(() {
      if (_visible == false) {
        _visible = true;
      } else {
        _visible = false;
      }
    });
  }

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

              /// Botão para adicionar um card [DELETAR], serve apenas para testes
              Observer(builder: (_) {
                return ElevatedButton(
                    onPressed: () {
                      store.incrementOrder(data);
                    },
                    child: const Text('data'));
              }),


              SizedBox(
                height: screen.height * 0.01,
              ),

              // Retorna 2 Widgets, onde um é para caso não tenha pedidos e o outro caso tenha.
              Observer(
                builder: (_) {
                  return store.order.isEmpty
                      ? _emptyOrder()
                      : _listViewOrder(context);
                },
              )
            ],
          ),
        ),

        /// Status order, irá sobrepor o [ListViewOrder], com o as informações da order
        Visibility(
          visible: _visible,
          child: _infoOrder(),
        )
      ],
    );
  }

  /// [ListViewOrder] lista de order
  Widget _listViewOrder(BuildContext context) {
    final OrderStore store = Modular.get();
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width,
      height: screen.height * 0.6,
      child: ListView.builder(
        itemCount: store.order.length,
        itemBuilder: (context, index) {
          return _cardOrder(context, index, store);
        },
      ),
    );
  }

  /// [CardOrder] card da order
  Widget _cardOrder(BuildContext context, int index, OrderStore store) {
    final Size screen = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () {
            _setVisible();
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
    Color corStatus = Colors.white;
    if (status == 'Em preparo') {
      corStatus = Colors.amber;
    } else if (status == 'A caminho') {
      corStatus = Colors.blue;
    } else if (status == 'Entregador chogou') {
      corStatus = Colors.green;
    }
  
    return Container(
      decoration: BoxDecoration(
          color: corStatus, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(5),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  /// [emptyOrder], caso não tenhsa pedidos
  Widget _emptyOrder() {
    final Size screen = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const Text(
            'Você ainda não pediu',
            style: TextStyle(
              fontFamily: 'Nunito',
            ),
          ),
          const Text(
            'Que tal conhecer as melhores opções na sua região?',
            style: TextStyle(fontFamily: 'Nunito', color: tertiaryCollor),
          ),
          TextButton(
              onPressed: () => Modular.to.navigate('/'),
              child: const Text(
                'Ir para o início',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    color: secondaryCollor),
              ))
        ],
      ),
    );
  }

  /// [InfoOrder] page que mostará os detalhes do pedido
  Widget _infoOrder() {
    final Size screen = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
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
                    Observer(builder: (_) {
                      return IconButton(
                          onPressed: () {
                            _setVisible();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: secondaryCollor,
                          ));
                    }),
                    const Text(
                      'Detalhes do pedido',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container() // Não deleta, esse container ta servindo para centralizar o texto
                  ],
                ),
              ),
              _statusOrderinfo(),

              SizedBox(height: screen.height * 0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // Container p/ as informações do pedido
                    width: screen.width * 0.55,
                    height: screen.height * 0.5,
                    decoration: _containerDecoration(),
                  ),

                  Container(
                    // Container p/ ficar os botões
                    width: screen.width * 0.4,
                    height: screen.height * 0.5,
                    decoration: _containerDecoration(),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /// [Divisor dos Status]
  Widget _statusOrderinfo(){
    final Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width,
      height: screen.height * 0.2,
      decoration: _containerDecoration()
    );
  }

  /// [BoxShadow] dos container divisores
  BoxDecoration _containerDecoration(){
    return BoxDecoration(
      color: primaryCollor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 7,
          offset: Offset(0, 3)
        )
      ]
    );
  }
}
