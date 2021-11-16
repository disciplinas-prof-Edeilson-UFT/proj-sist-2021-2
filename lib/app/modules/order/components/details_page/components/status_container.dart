import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/components/rating/rating_order.dart';
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
        const AutoSizeText(
          'Acompanhe seu pedido',
          presetFontSizes: [22, 16, 14],
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w500,
          ),
        ),
        const Divider(
          height: 20,
          color: Colors.transparent,
        ),
        CircularPercentIndicator(
          radius: 150,
          center: const AutoSizeText(
            'Completo', //TODO store.order!.status.toString(), isso é dependente de uma ação do logista então nao tem com atualizar isso
            presetFontSizes: [16, 14, 12],
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
            ),
          ),
          percent:
              1, //TODO _percentIndicator(status: store.order!.status.toString()),
          backgroundColor: primaryCollor,
          progressColor: secondaryCollor,
          lineWidth: 16,
        ),
        const RatingOrder(),
      ],
    );
  }

  // Função para consumir o banco de dados e atualizar o status e progresso do pedido
  _percentIndicator({String? status}) {
    if (status == 'started') {
      return 0.1;
    } else if (status == 'doing') {
      return 0.2;
    } else if (status == 'done') {
      return 0.4;
    } else if (status == 'delivering') {
      return 0.6;
    } else if (status == 'completed') {
      return 0.8;
    } else {
      return 1;
    }
  }
}
