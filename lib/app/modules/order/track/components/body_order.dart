
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/repositories/order/order_repository.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';
import 'package:pscomidas/app/modules/order/track/components/empty_order.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  State<BodyOrder> createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  final OrderStore store = Modular.get();
  OrderRepository repository = Modular.get<OrderRepository>();
  bool _isLoading = false;

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

              SizedBox(
                height: screen.height * 0.01,
              ),

              Observer(
                builder: (_) { 
                  store.getTeste();
                  return store.orderList.isEmpty 
                    ? const EmptyOrder()
                    : Observer(builder: (_) {
                      return SizedBox(
                        width: screen.width,
                        height: screen.height * 0.6,
                        child: ListView.builder(
                          itemCount: store.orderList.length,
                          itemBuilder: (context, index) {
                              return _cardOrder(context, index, store);
                            },
                          ),
                        );
                      });
                },
              ),

            ],
          ),
        ),
      ],
    );
  }

  /// [CardOrder] card da order
  Widget _cardOrder(BuildContext context, int index, OrderStore store) {
    final Size screen = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
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
                          'Restaurante',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: screen.width * 0.025,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Preço: ${store.orderList.elementAt(index).orderPrice}',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: screen.width * 0.015,
                          )
                        ),
                        const Text(
                          'Status: [ERRO]', // O Order.fromDocument, está retornando uma String e o atributo ta esperando um OrderType
                          style: TextStyle(color: tertiaryCollor),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: secondaryCollor,
                          textStyle: const TextStyle(
                            fontFamily: 'Nunito'
                          )
                        ),
                        onPressed: () => Modular.to.navigate('/orderDetails'), //  _orderDetails(),
                        child: const Text('Detalhes do produto')
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
