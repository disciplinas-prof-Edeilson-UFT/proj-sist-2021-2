import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class EmptyOrder extends StatefulWidget {
  const EmptyOrder({ Key? key }) : super(key: key);

  @override
  _EmptyOrderState createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
  @override
  Widget build(BuildContext context) {
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
                color: secondaryCollor
              ),
            )
          )
        ],
      ),
    );
  }
}