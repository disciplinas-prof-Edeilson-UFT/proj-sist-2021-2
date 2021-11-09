import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class StatusContainer extends StatefulWidget {
  const StatusContainer({Key? key}) : super(key: key);

  @override
  _StatusContainerState createState() => _StatusContainerState();
}

class _StatusContainerState extends State<StatusContainer> {
  final OrderStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AutoSizeText('Acompanhe seu pedido'),
        CircularPercentIndicator(
          radius: 150,
          center:
              const Text('Status'), //TODO Text(store.order!.status.toString()),
          percent:
              0.1, //TODO _percentIndicator(status: store.order!.status.toString()),
          backgroundColor: primaryCollor,
          progressColor: secondaryCollor,
          lineWidth: 16,
        )
      ],
    );
  }

  // Função para consumir o banco de dados e atualizar o status e progresso do pedido
  _percentIndicator({String? status}) {
    if (status == 'Pedido Aceito') {
      return 0.1;
    } else if (status == 'Preparando Pedido') {
      return 0.2;
    } else if (status == 'Pedido Pronto') {
      return 0.4;
    } else if (status == 'Pedido Pronto') {
      return 0.6;
    } else if (status == 'Saiu para entrega') {
      return 0.8;
    } else {
      return 1;
    }
  }
}
