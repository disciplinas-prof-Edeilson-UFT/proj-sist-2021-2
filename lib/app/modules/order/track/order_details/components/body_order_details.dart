import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/track/order_details/components/cancel_order.dart';
import 'package:pscomidas/app/modules/order/track/components/info_order.dart';

class BodyOrderDetails extends StatefulWidget {
  const BodyOrderDetails({ Key? key }) : super(key: key);

  @override
  _BodyOrderDetailsState createState() => _BodyOrderDetailsState();
}

class _BodyOrderDetailsState extends State<BodyOrderDetails> {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () => Modular.to.navigate('/order'),
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
                    const Spacer() // Não deleta, está servindo para centralizar o texto
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
      ]
    );
  }

}