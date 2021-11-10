import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/order/components/track/components/info_order.dart';
import 'package:pscomidas/app/modules/order/order_store.dart';

class DetailButton extends StatelessWidget {
  final String name;
  const DetailButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: secondaryCollor,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return const DetailsDialog();
            });
      },
    );
  }
}

class DetailsDialog extends StatefulWidget {
  const DetailsDialog({Key? key}) : super(key: key);

  @override
  _DetailsDialogState createState() => _DetailsDialogState();
}

class _DetailsDialogState extends State<DetailsDialog> {
  final OrderStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Detalhes do Pedido")),
      actions: <Widget>[
        Center(
          child: Column(
            children: const [
              Divider(
                height: 30,
                thickness: 2,
              ),
              InfoOrder(),
              Divider(
                height: 10,
                thickness: 2,
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: const Text("Sair", style: TextStyle(color: primaryCollor)),
          style: ElevatedButton.styleFrom(
            primary: secondaryCollor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
